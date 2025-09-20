import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:open_filex/open_filex.dart';

import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class AuditMakeConstatPage extends StatelessWidget {
  static const String routeName = '/audit-make-constat';
  const AuditMakeConstatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'PERMIS A CHAUD',
      paddingHorizontale: 0,
      body: ConstatBody(),
    );
  }
}

class ConstatBody extends StatefulWidget {
  const ConstatBody({super.key});

  @override
  State<ConstatBody> createState() => _ConstatBodyState();
}

class _ConstatBodyState extends State<ConstatBody> {
  final _desc = TextEditingController();
  final List<_Attach> _files = [];

  TextStyle get _h1 => GoogleFonts.poppins(
    fontSize: 28,
    height: 1.15,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF0B3A3C),
  );

  TextStyle get _hint =>
      GoogleFonts.poppins(color: const Color(0xFFA5A7AE), fontSize: 16);

  Future<void> _pickDocs() async {
    final res = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withReadStream: true,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'png',
        'jpg',
        'jpeg',
        'mp4',
        'mov',
      ],
    );
    if (res == null) return;
    setState(() {
      for (final f in res.files) {
        _files.add(_Attach(path: f.path!, name: f.name));
      }
    });
  }

  Future<void> _pickCamera() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (img == null) return;
    setState(() => _files.add(_Attach(path: img.path, name: img.name)));
  }

  bool get _canSubmit => _desc.text.trim().isNotEmpty || _files.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text('Faire un constat', style: _h1),
          const SizedBox(height: 18),

          // Zone de saisie
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF2F2F2F)),
            ),
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
            child: Column(
              children: [
                TextField(
                  controller: _desc,
                  maxLines: 10,
                  minLines: 10,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description',
                    hintStyle: _hint,
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      tooltip: 'Joindre un fichier',
                      onPressed: _pickDocs,
                      icon: const Icon(
                        Icons.attachment_rounded,
                        size: 28,
                        color: Color(0xFF3C3C3C),
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      tooltip: 'Prendre une photo',
                      onPressed: _pickCamera,
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        size: 28,
                        color: Color(0xFF3C3C3C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Liste des pièces jointes (style ligne PDF + corbeille rouge)
          const SizedBox(height: 18),
          ..._files.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  _fileLeading(a.ext),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      // onTap: () => OpenFilex.open(a.path),
                      child: Text(
                        a.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => setState(() => _files.remove(a)),
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      color: Color(0xFFFF3B30),
                      size: 28,
                    ),
                    tooltip: 'Supprimer',
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Bouton TERMINER
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _canSubmit
                  ? () {
                      // TODO: envoyer _desc.text et _files (paths) à l’API
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Constat enregistré')),
                      );
                      setState(() {
                        _desc.clear();
                        _files.clear();
                      });
                    }
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: cs.primary,
                disabledBackgroundColor: cs.primary.withOpacity(.35),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('TERMINER'),
            ),
          ),
        ],
      ),
    );
  }

  // Icône d’aperçu type de fichier (PDF / image / vidéo / doc)
  Widget _fileLeading(String ext) {
    final lower = ext.toLowerCase();
    IconData icon;
    Color color;
    if (lower == 'pdf') {
      icon = Icons.picture_as_pdf_rounded;
      color = const Color(0xFFE53935);
    } else if (['png', 'jpg', 'jpeg', 'heic', 'webp'].contains(lower)) {
      icon = Icons.image_rounded;
      color = const Color(0xFF4CAF50);
    } else if (['mp4', 'mov', 'm4v'].contains(lower)) {
      icon = Icons.play_circle_filled_rounded;
      color = const Color(0xFF7C4DFF);
    } else {
      icon = Icons.insert_drive_file_rounded;
      color = const Color(0xFF607D8B);
    }
    return Icon(icon, color: color, size: 28);
  }
}

class _Attach {
  final String path;
  final String name;
  _Attach({required this.path, required this.name});
  String get ext => name.contains('.') ? name.split('.').last : '';
}
