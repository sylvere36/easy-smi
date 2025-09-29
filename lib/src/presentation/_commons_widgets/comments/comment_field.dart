import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/theming/app_color.dart';

class CommentFieldWidget extends StatefulWidget {
  final String action;
  final dynamic actionId;
  const CommentFieldWidget({
    super.key,
    required this.action,
    required this.actionId,
  });

  @override
  State<CommentFieldWidget> createState() => _CommentFieldWidgetState();
}

class _CommentFieldWidgetState extends State<CommentFieldWidget> {
  final TextEditingController _ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: _roundedField(
        child: Row(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Icon(Icons.emoji_emotions_outlined, color: _P.sub),
            ),
            InkWell(
              onTap: () {
                if (_ctrl.text.trim().isEmpty) return;
                _ctrl.clear();
              },
              child: const Icon(Icons.send_rounded, color: _P.blue),
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
