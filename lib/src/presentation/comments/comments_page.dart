import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons/theming/app_color.dart';
import '../_commons_widgets/comments/avatar.dart';
import '../_commons_widgets/comments/comment_field.dart';
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
          const CommentFieldWidget(action: 'Action', actionId: 123),
        ],
      ),
    );
  }
}

Widget _commentRow(_Msg m) => Padding(
  padding: const EdgeInsets.only(bottom: 18),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      avatar(m.author),
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
                  Text(
                    m.time,
                    style: GoogleFonts.poppins(color: AppColors.sub),
                  ),
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

class _Msg {
  final String author, time, text;
  _Msg(this.author, this.time, this.text);
}
