import 'package:flutter/material.dart';

/// Show a full-screen image viewer dialog.
/// - [images] : list of image URLs
/// - [initialIndex] : index to open on
Future<void> showNetworkImageViewer(
  BuildContext context, {
  required List<String> images,
  int initialIndex = 0,
}) {
  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.95),
    barrierDismissible: true,
    barrierLabel: 'image-viewer',
    pageBuilder: (_, _, _) => _ImageViewerDialog(
      images: images,
      initialIndex: initialIndex.clamp(0, images.length - 1),
    ),
  );
}

class _ImageViewerDialog extends StatefulWidget {
  const _ImageViewerDialog({required this.images, required this.initialIndex});

  final List<String> images;
  final int initialIndex;

  @override
  State<_ImageViewerDialog> createState() => _ImageViewerDialogState();
}

class _ImageViewerDialogState extends State<_ImageViewerDialog> {
  late final PageController _pageCtrl = PageController(
    initialPage: widget.initialIndex,
  );
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  void _next() {
    if (_index < widget.images.length - 1) {
      _pageCtrl.nextPage(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  void _prev() {
    if (_index > 0) {
      _pageCtrl.previousPage(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Pages with zoom
            PageView.builder(
              controller: _pageCtrl,
              onPageChanged: (i) => setState(() => _index = i),
              itemCount: images.length,
              itemBuilder: (_, i) {
                return Center(child: _ZoomableNetworkImage(url: images[i]));
              },
            ),

            // Close button (top-right)
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                tooltip: 'Fermer',
              ),
            ),

            // Left arrow
            if (_index > 0)
              Positioned(
                bottom: 72,
                left: 48,
                child: _NavButton(
                  icon: Icons.chevron_left_rounded,
                  onTap: _prev,
                ),
              ),

            // Right arrow
            if (_index < images.length - 1)
              Positioned(
                bottom: 72,
                right: 48,
                child: _NavButton(
                  icon: Icons.chevron_right_rounded,
                  onTap: _next,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.08),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.white, size: 34),
        ),
      ),
    );
  }
}

class _ZoomableNetworkImage extends StatefulWidget {
  const _ZoomableNetworkImage({required this.url});
  final String url;

  @override
  State<_ZoomableNetworkImage> createState() => _ZoomableNetworkImageState();
}

class _ZoomableNetworkImageState extends State<_ZoomableNetworkImage> {
  final TransformationController _transformCtrl = TransformationController();
  late TapDownDetails _doubleTapDetails;

  void _handleDoubleTap() {
    // quick zoom in/out
    if (_transformCtrl.value != Matrix4.identity()) {
      _transformCtrl.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      _transformCtrl.value = Matrix4.identity()
        ..translate(-position.dx * 1.5, -position.dy * 1.5)
        ..scale(2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (d) => _doubleTapDetails = d,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: _transformCtrl,
        minScale: 1,
        maxScale: 4,
        child: AspectRatio(
          aspectRatio: 16 / 9, // letterbox look; remove if not desired
          child: Image.network(
            widget.url,
            fit: BoxFit.cover,
            // fadeInDuration: const Duration(milliseconds: 200),
            // loadingBuilder: (_, Widget child, _) => const Center(
            //   child: CircularProgressIndicator(
            //     strokeWidth: 2,
            //     color: Colors.white,
            //   ),
            // ),
            errorBuilder: (_, _, _) =>
                const Icon(Icons.broken_image, color: Colors.white70, size: 48),
          ),
        ),
      ),
    );
  }
}
