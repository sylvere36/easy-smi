import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

import '../../_commons/route/app_router.gr.dart';

enum AttachKind { image, video, file }

class Attach {
  final File file;
  final AttachKind kind;
  final String? name; // utile pour les .pdf, .docx
  Attach(this.file, this.kind, {this.name});
}

class AddNewBadEventBody extends StatefulWidget {
  const AddNewBadEventBody({super.key});

  @override
  State<AddNewBadEventBody> createState() => _AddNewBadEventBodyState();
}

class _AddNewBadEventBodyState extends State<AddNewBadEventBody> {
  final _formKey = GlobalKey<FormState>();
  bool canNextStep = false;

  // Étape 1
  String? _typeEvt;
  final _siteCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final List<Attach> _attaches = [];

  // Étape 2
  String? _typeMesure;
  final _descActionCtrl = TextEditingController();
  String? _justifType; // Écart | Opportunité
  final _justifCtrl = TextEditingController();

  final _picker = ImagePicker();

  TextStyle get _label =>
      GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 24, height: 1.2);

  // ------------------- Ajout de pièces -------------------

  Future<void> _pickFromCamera() async {
    final x = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (x != null) {
      setState(() => _attaches.add(Attach(File(x.path), AttachKind.image)));
    }
  }

  Future<void> _pickImageGallery() async {
    final x = await _picker.pickMultiImage(imageQuality: 85);
    if (x.isNotEmpty) {
      setState(() {
        _attaches.addAll(x.map((e) => Attach(File(e.path), AttachKind.image)));
      });
    }
  }

  Future<void> _pickVideo() async {
    final x = await _picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(minutes: 10),
    );
    if (x != null) {
      setState(() => _attaches.add(Attach(File(x.path), AttachKind.video)));
    }
  }

  Future<void> _pickFileAny() async {
    final res = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
        'txt',
      ],
    );
    if (res != null) {
      setState(() {
        for (final f in res.files) {
          if (f.path != null) {
            _attaches.add(Attach(File(f.path!), AttachKind.file, name: f.name));
          }
        }
      });
    }
  }

  void _showAddSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Wrap(
            runSpacing: 12,
            children: [
              _PickTile(
                icon: Icons.insert_drive_file_outlined,
                label: 'Ajouter un fichier',
                onTap: () {
                  Navigator.pop(context);
                  _pickFileAny();
                },
              ),
              _PickTile(
                icon: Icons.photo_library_outlined,
                label: 'Depuis la galerie',
                onTap: () {
                  Navigator.pop(context);
                  _pickImageGallery();
                },
              ),
              _PickTile(
                icon: Icons.videocam_outlined,
                label: 'Ajouter une vidéo',
                onTap: () {
                  Navigator.pop(context);
                  _pickVideo();
                },
              ),
              _PickTile(
                icon: Icons.photo_camera_outlined,
                label: 'Prendre une photo',
                onTap: () {
                  Navigator.pop(context);
                  _pickFromCamera();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- Prévisualisations -------------------

  void _openPreview(Attach a) {
    if (a.kind == AttachKind.image) {
      showDialog(
        context: context,
        barrierColor: Colors.black,
        builder: (_) => Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              InteractiveViewer(child: Image.file(a.file, fit: BoxFit.contain)),
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                ),
              ),
              // Champ de titre (look maquette)
              Positioned(
                left: 16,
                right: 16,
                bottom: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.08),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'AJOUTER UN TITRE…',
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            letterSpacing: .3,
                          ),
                        ),
                      ),
                      const Icon(Icons.send_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (a.kind == AttachKind.video) {
      _openVideoSheet(a.file);
    } else {
      // fichier générique -> ouvrir avec une app externe si nécessaire
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fichier ajouté (aperçu non disponible).'),
        ),
      );
    }
  }

  void _openVideoSheet(File file) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (_) => _VideoPlayerSheet(file: file),
    );
  }

  // ------------------- UI -------------------

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          // ---------- ÉTAPE 1 ----------
          if (!canNextStep) ...[
            const _StepHeader(title: 'NOUVEL EVENNEMENT\nNON DESIRABLE'),
            const SizedBox(height: 28),

            Text('Type de l’evennement', style: _label.copyWith(fontSize: 20)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _typeEvt,
              items: const [
                'Accident',
                'Incident',
                'Situations dangereuse',
                'Non conformité',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _typeEvt = v),
              decoration: _fieldDecor(),
              validator: (v) => v == null ? 'Veuillez sélectionner' : null,
            ),
            const SizedBox(height: 20),

            Text('Site', style: _label.copyWith(fontSize: 20)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _siteCtrl,
              decoration: _fieldDecor(),
              validator: (v) => (v ?? '').isEmpty ? 'Champ requis' : null,
            ),
            const SizedBox(height: 20),

            Text(
              'Description de l’evennement',
              style: _label.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descCtrl,
              maxLines: 8,
              decoration: _fieldDecor().copyWith(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.attachment_outlined, size: 26),
                      onPressed: _showAddSheet,
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_camera_outlined, size: 26),
                      onPressed: _pickFromCamera,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            // Galerie des pièces jointes
            if (_attaches.isNotEmpty)
              _AttachmentsBar(
                attachments: _attaches,
                onTap: _openPreview,
                onRemove: (a) => setState(() => _attaches.remove(a)),
              ),

            const SizedBox(height: 28),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1565D8),
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  canNextStep = true;
                });
                // if (_formKey.currentState!.validate()) {
                Scrollable.ensureVisible(
                  _step2Key.currentContext!,
                  duration: const Duration(milliseconds: 300),
                );
                // }
              },
              child: Text(
                'SUIVANT',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ],

          // ---------- ÉTAPE 2 ----------
          if (canNextStep) ...[
            _StepHeader(
              key: _step2Key,
              title: 'Quelles sont les mesures\nimmédiates prises ?',
            ),
            const SizedBox(height: 20),

            Text('Type de mesure', style: _label.copyWith(fontSize: 20)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _typeMesure,
              items: const [
                'Préventives',
                'Correctives',
                'Amélioration',
                'Curative',
                'Recurente',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _typeMesure = v),
              decoration: _fieldDecor(),
              validator: (v) => v == null ? 'Veuillez sélectionner' : null,
            ),
            const SizedBox(height: 20),

            Text(
              'Description de l’action',
              style: _label.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descActionCtrl,
              maxLines: 6,
              decoration: _fieldDecor(),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Justification',
                    style: _label.copyWith(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _justifType,
                  hint: const Text('Type'),
                  items: const ['Écart', 'Opportunité']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => setState(() => _justifType = v),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _justifCtrl,
              maxLines: 6,
              decoration: _fieldDecor(),
            ),

            const SizedBox(height: 28),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1565D8),
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.router.push(const DeclarateEventRoute());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Évènement enregistré (démo).'),
                    ),
                  );
                }
              },
              child: Text(
                'TERMINER',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  final _step2Key = GlobalKey();

  InputDecoration _fieldDecor({String?hint, Widget? suffix}) => InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(color: Colors.black26),
    suffixIcon: suffix,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF1565D8), width: 1.4),
    ),
  );
}

// ---------- Petits widgets ----------

class _PickTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _PickTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE9F0FE),
        child: Icon(icon, color: const Color(0xFF1565D8)),
      ),
      title: Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}

class _AttachmentsBar extends StatelessWidget {
  final List<Attach> attachments;
  final void Function(Attach) onTap;
  final void Function(Attach) onRemove;
  const _AttachmentsBar({
    required this.attachments,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: attachments.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, i) {
          final a = attachments[i];
          Widget thumb;
          switch (a.kind) {
            case AttachKind.image:
              thumb = Image.file(a.file, fit: BoxFit.cover);
              break;
            case AttachKind.video:
              thumb = Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(a.file, fit: BoxFit.cover),
                  const Align(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              );
              break;
            case AttachKind.file:
              thumb = Container(
                // color: const Color(0xFFF3F6FA),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.insert_drive_file_outlined,
                        size: 34,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          a.name ?? a.file.path.split('/').last,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              break;
          }

          return GestureDetector(
            onTap: () => onTap(a),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 140,
                    height: 100,
                    // color: const Color(0xFFEFF3F9),
                    child: thumb,
                  ),
                ),
                Positioned(
                  right: -8,
                  top: -8,
                  child: IconButton(
                    onPressed: () => onRemove(a),
                    icon: const Icon(Icons.cancel, color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StepHeader extends StatelessWidget {
  final String title;
  const _StepHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 23,
          height: 1.25,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF0F3E46),
        ),
      ),
    );
  }
}

// ---------- Lecteur vidéo dans un bottom sheet ----------

class _VideoPlayerSheet extends StatefulWidget {
  final File file;
  const _VideoPlayerSheet({required this.file});

  @override
  State<_VideoPlayerSheet> createState() => _VideoPlayerSheetState();
}

class _VideoPlayerSheetState extends State<_VideoPlayerSheet> {
  late final VideoPlayerController _vc;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _vc = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() => _ready = true);
      });
  }

  @override
  void dispose() {
    _vc.dispose();
    super.dispose();
  }

  void _seek(int seconds) {
    final pos = _vc.value.position + Duration(seconds: seconds);
    _vc.seekTo(pos /* .clamp(Duration.zero, _vc.value.duration) */);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        height: h * .86,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: _ready ? _vc.value.aspectRatio : 16 / 9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _ready ? VideoPlayer(_vc) : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _seek(-15),
                            icon: const Icon(
                              Icons.replay_10_rounded,
                              color: Colors.white,
                              size: 38,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () => setState(() {
                              _vc.value.isPlaying ? _vc.pause() : _vc.play();
                            }),
                            icon: Icon(
                              _vc.value.isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              color: Colors.white,
                              size: 54,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () => _seek(15),
                            icon: const Icon(
                              Icons.forward_10_rounded,
                              color: Colors.white,
                              size: 38,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _ready
                            ? Slider(
                                value: _vc.value.position.inMilliseconds
                                    .toDouble()
                                    .clamp(
                                      0,
                                      _vc.value.duration.inMilliseconds
                                          .toDouble(),
                                    ),
                                max: _vc.value.duration.inMilliseconds
                                    .toDouble()
                                    .clamp(1, double.infinity),
                                onChanged: (v) => _vc.seekTo(
                                  Duration(milliseconds: v.toInt()),
                                ),
                                activeColor: Colors.white,
                                inactiveColor: Colors.white24,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
