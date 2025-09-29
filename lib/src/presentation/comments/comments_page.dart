import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/comment_body.dart';

@RoutePage()
class CommentsPage extends StatelessWidget {
  static const String routeName = '/comments';

  final String commentableType;
  final dynamic commentableId;
  const CommentsPage({
    super.key,
    required this.commentableType,
    required this.commentableId,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'Commentaires',
      body: CommentsBody(
        commentableType: commentableType,
        commentableId: commentableId,
      ),
    );
  }
}
