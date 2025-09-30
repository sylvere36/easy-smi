import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/communication/comments_bloc.dart';
import '../../_commons_widgets/comments/comment_field.dart';
import '../../_commons_widgets/comments/comment_line.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/my_toast.dart';

class CommentsBody extends StatefulWidget {
  const CommentsBody({
    super.key,
    required this.commentableType,
    required this.commentableId,
  });

  final String commentableType;
  final dynamic commentableId;

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  @override
  void initState() {
    super.initState();
    if (widget.commentableId == null || widget.commentableId == '0') {
      errorToast(context: context, msg: 'ID de l\'élément commenté est nul');
      return;
    }
    BlocProvider.of<CommentsBloc>(context).add(
      CommentsEvent.fetchRequested(
        commentableType: widget.commentableType,
        commentableId: widget.commentableId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.isLoading)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: LoadingWidget(),
                        ),
                      if (!state.isLoading && state.items.isEmpty)
                        EmptyWidget.noComments(),
                      if (!state.isLoading && state.items.isNotEmpty)
                        ...state.items.map(
                          (comment) => commentLine(
                            comment.userName ?? 'Inconnu',
                            comment.humanReadableDate,
                            comment.body,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              CommentFieldWidget(
                isLoading: state.isSubmitting,
                onSend: (String text, File? file) {
                  if (text.isEmpty && file == null) return;
                  if (text.isEmpty) {
                    errorToast(
                      context: context,
                      msg:
                          'Le commentaire ne peut pas être vide si aucun fichier n\'est attaché.',
                    );
                    return;
                  }
                  BlocProvider.of<CommentsBloc>(context).add(
                    CommentsEvent.addCommentRequested(
                      commentableType: widget.commentableType,
                      commentableId: widget.commentableId,
                      attachmentPath: file?.path,
                      body: text,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
