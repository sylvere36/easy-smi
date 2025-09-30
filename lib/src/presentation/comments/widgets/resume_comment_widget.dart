import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/communication/comments_bloc.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/comments/comment_line.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';

class ResumeCommentWidget extends StatefulWidget {
  final String commentableType;
  final dynamic commentableId;
  final int? commentsCount;
  const ResumeCommentWidget({
    super.key,
    required this.commentableType,
    required this.commentableId,
    this.commentsCount,
  });

  @override
  State<ResumeCommentWidget> createState() => _ResumeCommentWidgetState();
}

class _ResumeCommentWidgetState extends State<ResumeCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            children: [
              Text(
                'Commentaire(s)',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: _tinyCounter(widget.commentsCount ?? 0),
              ),
              const Spacer(),
              if ((widget.commentsCount ?? 0) > 3)
                InkWell(
                  onTap: () {
                    context.router.push(
                      CommentsRoute(
                        commentableType: widget.commentableType,
                        commentableId: widget.commentableId,
                      ),
                    );
                  },
                  child: Text(
                    'Voir tout',
                    style: GoogleFonts.poppins(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),

        BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: LoadingWidget());
            }
            if (state.items.isEmpty) {
              return EmptyWidget.noComments();
            }
            return Column(
              children: [
                ...state.items
                    .take(3)
                    .map(
                      (comment) => commentLine(
                        comment.userName ?? 'Inconnu',
                        comment.humanReadableDate,
                        comment.body,
                      ),
                    ),
              ],
            );
          },
        ),
      ],
    );
  }
}

Widget _tinyCounter(int n) => Container(
  decoration: BoxDecoration(
    color: AppColors.badge,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Text(
      '$n',
      style: GoogleFonts.poppins(
        color: AppColors.blue,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
    ),
  ),
);
