import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/theming/app_color.dart';
import '../loading_widget.dart';

class CommentFieldWidget extends StatefulWidget {
  final void Function(String, File?) onSend;
  final bool? isLoading;
  const CommentFieldWidget({super.key, required this.onSend, this.isLoading});

  @override
  State<CommentFieldWidget> createState() => _CommentFieldWidgetState();
}

class _CommentFieldWidgetState extends State<CommentFieldWidget> {
  final TextEditingController _ctrl = TextEditingController();
  File? _attachedFile;
  bool _picking = false;

  Future<void> _pickFile() async {
    if (_picking) return; // prevent double tap
    setState(() => _picking = true);
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        setState(() {
          _attachedFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erreur sélection fichier: $e')));
      }
    } finally {
      if (mounted) setState(() => _picking = false);
    }
  }

  void _send() {
    final text = _ctrl.text.trim();
    if (text.isEmpty && _attachedFile == null) return;
    final fileToSend = _attachedFile;
    widget.onSend(text, fileToSend);
    _ctrl.clear();
    setState(() {
      _attachedFile = null;
    });
    FocusScope.of(context).unfocus();
  }

  Widget _attachmentChip() {
    if (_attachedFile == null) return const SizedBox.shrink();
    final name = _attachedFile!.path.split('/').last;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E5EA)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.attachment, size: 18, color: _P.blue),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              name,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => setState(() => _attachedFile = null),
            child: const Icon(Icons.close, size: 18, color: _P.sub),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: _roundedField(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Ecrire  un commentaire',
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(color: _P.sub),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                    ),
                    style: GoogleFonts.poppins(),
                  ),
                ),
                // Attach file button
                if (widget.isLoading == true)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: LoadingWidget(),
                    ),
                  ),
                if (widget.isLoading != true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: _pickFile,
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: _picking
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Icon(
                                _attachedFile == null
                                    ? Icons.attach_file
                                    : Icons.attach_file,
                                color: _attachedFile == null ? _P.sub : _P.blue,
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                if (widget.isLoading != true)
                  InkWell(
                    onTap: _send,
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.send_rounded, color: _P.blue),
                    ),
                  ),
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _attachedFile != null
                  ? _attachmentChip()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _P {
  static const blue = AppColors.primary;
  static const sub = Color(0xFF6B7280);
  static const field = Color(0xFFF2F5F8);
}

Widget _roundedField({required Widget child}) => Container(
  decoration: BoxDecoration(
    color: _P.field,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0xFFE5EAF0)),
  ),
  child: child,
);
