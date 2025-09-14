import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class CommentsPage extends StatelessWidget {
  static const String routeName = '/comments';
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(appBarTitle: 'Commentaires', body: CommentsBody());
  }
}

/// ====== COMMENTS PAGE (body only) ======
class CommentsBody extends StatefulWidget {
  const CommentsBody({super.key});

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  final List<_Msg> _msgs = List.generate(
    5,
    (i) => _Msg(
      'Jeanette MOUHOUTON',
      'Il y a ${14 + i} min',
      'Les documents fournies ne respectent par les normes internationnales',
    ),
  );
  final TextEditingController _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              itemCount: _msgs.length,
              itemBuilder: (_, i) => _commentRow(_msgs[i]),
            ),
          ),
          // composer pinned to bottom and safe with keyboard
          Padding(
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
                      setState(() {
                        _msgs.insert(
                          0,
                          _Msg('Moi', 'à l’instant', _ctrl.text.trim()),
                        );
                        _ctrl.clear();
                      });
                    },
                    child: const Icon(Icons.send_rounded, color: _P.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _roundedField({required Widget child}) => Container(
  decoration: BoxDecoration(
    color: _P.field,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0xFFE5EAF0)),
  ),
  child: child,
);

Widget _commentRow(_Msg m) => Padding(
  padding: const EdgeInsets.only(bottom: 18),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _avatar(m.author),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      m.author,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(m.time, style: GoogleFonts.poppins(color: _P.sub)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(m.text, style: GoogleFonts.poppins(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

/// Colors used across the screen (tuned to match the mock)
class _P {
  static const blue = AppColors.primary;
  static const sub = Color(0xFF6B7280);
  static const field = Color(0xFFF2F5F8);
}

Widget _avatar(String name) {
  final parts = name.split(' ');
  final initials =
      (parts.isNotEmpty ? parts.first.characters.first : '') +
      (parts.length > 1 ? parts.last.characters.first : '');
  return CircleAvatar(
    radius: 20,
    backgroundColor: const Color(0xFF1DBA9F),
    child: Text(
      initials.toUpperCase(),
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

class _Msg {
  final String author, time, text;
  _Msg(this.author, this.time, this.text);
}
