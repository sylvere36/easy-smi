import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../injection_container.dart';
import '../../infrastructure/_commons/network/user_session.dart';
import '../_commons/theming/app_color.dart';
import 'empty_widget.dart';

@RoutePage()
class FilePreviewPage extends StatefulWidget {
  static const String routeName = '/file-preview';
  final String path;
  final String? fileName;

  const FilePreviewPage({super.key, required this.path, this.fileName});

  @override
  State<FilePreviewPage> createState() => _FilePreviewPageState();
}

class _FilePreviewPageState extends State<FilePreviewPage> {
  String? fullUrl;
  String? authToken;
  bool isLoading = true;
  String? errorMessage;
  late String fileExtension;
  late String displayName = 'Fichier';

  @override
  void initState() {
    super.initState();
    _initializePreview();
  }

  Future<void> _initializePreview() async {
    try {
      // Récupérer les paramètres de l'organisation et le token
      final userSession = sl<UserSession>();
      final orgSettings = await userSession.getOrganizationSettings();
      authToken = await userSession.getAuthToken();

      if (orgSettings?.baseUrl == null) {
        setState(() {
          errorMessage = 'Configuration manquante';
          isLoading = false;
        });
        return;
      }

      if (authToken == null) {
        setState(() {
          errorMessage = 'Token d\'authentification manquant';
          isLoading = false;
        });
        return;
      }

      // Construire l'URL complète
      fullUrl = '${orgSettings!.baseUrl}/api/minio/storage/${widget.path}';

      // Déterminer l'extension du fichier
      fileExtension = _getFileExtension(widget.path);
      displayName = widget.fileName ?? _getFileName(widget.path);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erreur lors du chargement: $e';
        isLoading = false;
      });
    }
  }

  String _getFileExtension(String path) {
    final parts = path.split('.');
    return parts.isNotEmpty ? parts.last.toLowerCase() : '';
  }

  String _getFileName(String path) {
    return path.split('/').last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(displayName),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.pop(),
        ),
        actions: const [
          // if (fullUrl != null)
          //   IconButton(
          //     icon: const Icon(Icons.download, color: Colors.black),
          //     onPressed: () => _downloadFile(),
          //   ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return EmptyWidget.error(
        title: 'Erreur',
        message: errorMessage,
        action: ElevatedButton(
          onPressed: () => _initializePreview(),
          child: const Text('Réessayer'),
        ),
      );
    }

    if (fullUrl == null) {
      return EmptyWidget.error(
        title: 'Fichier introuvable',
        message: 'Impossible de charger le fichier demandé.',
      );
    }

    return _buildPreviewContent();
  }

  Widget _buildPreviewContent() {
    switch (fileExtension) {
      // Images
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'webp':
        return _buildImagePreview();

      // Vidéos
      case 'mp4':
      case 'mov':
      case 'avi':
      case 'mkv':
      case 'm4v':
      case 'mpeg':
      case 'mpg':
        return _buildVideoPreview();

      // Audio
      case 'mp3':
      case 'm4a':
      case 'wav':
      case 'aac':
        return _buildAudioPreview();

      // PDFs
      case 'pdf':
        return _buildPdfPreview();

      // SVG
      case 'svg':
        return _buildSvgPreview();

      // Documents Office/Google/Apple
      case 'doc':
      case 'docx':
      case 'xls':
      case 'xlsx':
      case 'ppt':
      case 'pptx':
      case 'pages':
      case 'numbers':
      case 'keynote':
        return _buildDocumentPreview();

      // Texte
      case 'txt':
      case 'md':
      case 'json':
      case 'xml':
      case 'csv':
        return _buildTextPreview();

      default:
        return _buildUnsupportedPreview();
    }
  }

  Widget _buildImagePreview() {
    return InteractiveViewer(
      child: Center(
        child: Image.network(
          fullUrl!,
          headers: {'Authorization': 'Bearer $authToken'},
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return EmptyWidget.error(
              title: 'Impossible de charger l\'image',
              message: 'Vérifiez votre connexion internet.',
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoPreview() {
    return _VideoPreviewWidget(url: fullUrl!, authToken: authToken!);
  }

  Widget _buildAudioPreview() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.music_note, size: 80, color: AppColors.sub),
          const SizedBox(height: 16),
          Text(
            displayName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _openInExternalApp(),
            icon: const Icon(Icons.open_in_new),
            label: const Text('Ouvrir avec une app externe'),
          ),
        ],
      ),
    );
  }

  Widget _buildPdfPreview() {
    return _NativePdfPreview(url: fullUrl!, authToken: authToken!);
  }

  Widget _buildSvgPreview() {
    return Center(
      child: SvgPicture.network(
        fullUrl!,
        headers: {'Authorization': 'Bearer $authToken'},
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildDocumentPreview() {
    return _WebViewPreview(url: fullUrl!, authToken: authToken!);
  }

  Widget _buildTextPreview() {
    return _TextFilePreview(url: fullUrl!, authToken: authToken!);
  }

  Widget _buildUnsupportedPreview() {
    return EmptyWidget(
      icon: Icons.insert_drive_file_outlined,
      title: 'Aperçu non disponible',
      message:
          'Ce type de fichier ($fileExtension) ne peut pas être prévisualisé.',
      action: ElevatedButton.icon(
        onPressed: () => _downloadFile(),
        icon: const Icon(Icons.download),
        label: const Text('Télécharger'),
      ),
    );
  }

  void _downloadFile() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Téléchargement en cours...')));
  }

  void _openInExternalApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ouverture dans une app externe...')),
    );
  }
}

// Widget pour la prévisualisation vidéo
class _VideoPreviewWidget extends StatefulWidget {
  final String url;
  final String authToken;

  const _VideoPreviewWidget({required this.url, required this.authToken});

  @override
  State<_VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<_VideoPreviewWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
      httpHeaders: {'Authorization': 'Bearer ${widget.authToken}'},
    );
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await _controller.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      // Gérer l'erreur d'initialisation
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(children: [VideoPlayer(_controller), _buildControls()]),
      ),
    );
  }

  Widget _buildControls() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            size: 64,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

// Widget pour les documents via WebView
class _WebViewPreview extends StatefulWidget {
  final String url;
  final String authToken;

  const _WebViewPreview({required this.url, required this.authToken});

  @override
  State<_WebViewPreview> createState() => _WebViewPreviewState();
}

class _WebViewPreviewState extends State<_WebViewPreview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://docs.google.com/viewer?url=${Uri.encodeComponent(widget.url)}',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

// Widget natif pour PDF
class _NativePdfPreview extends StatefulWidget {
  final String url;
  final String authToken;
  const _NativePdfPreview({required this.url, required this.authToken});

  @override
  State<_NativePdfPreview> createState() => _NativePdfPreviewState();
}

class _NativePdfPreviewState extends State<_NativePdfPreview> {
  PdfController? _pdfController;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final client = HttpClient();
      final req = await client.getUrl(Uri.parse(widget.url));
      req.headers.set('Authorization', 'Bearer ${widget.authToken}');
      final resp = await req.close();
      if (resp.statusCode != 200) {
        throw Exception('HTTP ${resp.statusCode}');
      }
      final bytes = await consolidateHttpClientResponseBytes(resp);
      final document = PdfDocument.openData(bytes);
      _pdfController = PdfController(document: document);
      if (mounted) {
        setState(() => _loading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return EmptyWidget.error(
        title: 'PDF',
        message: _error,
        action: ElevatedButton(
          onPressed: () {
            setState(() {
              _error = null;
              _loading = true;
            });
            _load();
          },
          child: const Text('Réessayer'),
        ),
      );
    }
    if (_pdfController == null) {
      return const Center(child: Text('Document indisponible'));
    }
    return PdfView(controller: _pdfController!, scrollDirection: Axis.vertical);
  }
}

// Widget pour les fichiers texte
class _TextFilePreview extends StatefulWidget {
  final String url;
  final String authToken;

  const _TextFilePreview({required this.url, required this.authToken});

  @override
  State<_TextFilePreview> createState() => _TextFilePreviewState();
}

class _TextFilePreviewState extends State<_TextFilePreview> {
  String? content;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(widget.url));
      request.headers.set('Authorization', 'Bearer ${widget.authToken}');
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringContent = await response.transform(utf8.decoder).join();
        setState(() {
          content = stringContent;
          isLoading = false;
        });
      } else {
        throw Exception('HTTP ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return EmptyWidget.error(title: 'Erreur de chargement', message: error);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(
        content ?? '',
        style: const TextStyle(fontFamily: 'monospace'),
      ),
    );
  }
}
