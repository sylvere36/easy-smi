import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../application/communication/comments_bloc.dart';
import '../../../../application/quizz/quizz_bloc.dart';
import '../../../../domain/quizz/models/quizz_item.dart';
import '../../../_commons/helpers/image_helper.dart';
import '../../../_commons/route/app_router.gr.dart';
import '../../../_commons/theming/app_color.dart';
import '../../../_commons_widgets/comments/comment_field.dart';
import '../../../_commons_widgets/loading_widget.dart';
import '../../../comments/widgets/resume_comment_widget.dart';

class CertificationDetailBody extends StatefulWidget {
  const CertificationDetailBody({super.key, required this.quizzItem});

  final QuizzItem quizzItem;

  @override
  State<CertificationDetailBody> createState() =>
      _CertificationDetailBodyState();
}

class _CertificationDetailBodyState extends State<CertificationDetailBody> {
  QuizzItem? quizzDetail;

  String commentTableType = 'quizz';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizzBloc>(
      context,
    ).add(QuizzEvent.fetchDetailRequested(id: widget.quizzItem.id));

    context.read<CommentsBloc>().add(
      CommentsEvent.fetchRequested(
        commentableType: commentTableType,
        commentableId: widget.quizzItem.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const blue = AppColors.primary;

    return BlocConsumer<QuizzBloc, QuizzState>(
      listener: (context, state) {
        if (state.detail != null) {
          setState(() {
            quizzDetail = state.detail;
          });
        }
      },
      builder: (context, state) {
        return quizzDetail == null
            ? const Center(child: LoadingWidget())
            : Column(
                children: [
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row (thumbnail + title)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // illustration
                              if (quizzDetail!.image.isNotEmpty)
                                FutureBuilder<String>(
                                  future: getFullImageUrl(quizzDetail!.image),
                                  builder: (context, asyncSnapshot) {
                                    if (asyncSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: LoadingWidget(),
                                      );
                                    } else if (asyncSnapshot.hasError) {
                                      return const Center(
                                        child: Icon(Icons.error),
                                      );
                                    } else {
                                      return SizedBox(
                                        width: 85,
                                        height: 85,
                                        child: Image.network(
                                          asyncSnapshot.data!,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                )
                              else
                                Container(
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF1E6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: Assets.images.quizz.image(),
                                ),
                              const SizedBox(width: 16),
                              // title
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      quizzDetail!.title,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // "Certification" + badge
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Certification',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        quizzDetail!.certification == 1
                                            ? const Icon(
                                                Icons.verified_rounded,
                                                color: blue,
                                                size: 20,
                                              )
                                            : const Icon(
                                                Icons.shield_rounded,
                                                color: AppColors.chipRed,
                                                size: 20,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Meta: last update + language
                          Row(
                            children: [
                              _MetaBlock(
                                label: 'Dernière mise à jour',
                                value: quizzDetail!.updatedAt == null
                                    ? 'N/A'
                                    : '${DateTime.parse(quizzDetail!.updatedAt!).day.toString().padLeft(2, '0')}/${DateTime.parse(quizzDetail!.updatedAt!).month.toString().padLeft(2, '0')}/${DateTime.parse(quizzDetail!.updatedAt!).year}',
                              ),
                              const SizedBox(width: 24),
                              const _MetaBlock(
                                label: 'Langue',
                                value: 'Francais',
                                icon: Icons.language,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Rating
                          Row(
                            children: [
                              _StarRow(
                                rating:
                                    quizzDetail!.tauxDeReussite?.toDouble() ??
                                    0,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${quizzDetail!.tauxDeReussite ?? 0}',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Detail title
                          Text(
                            'Detail',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Long description
                          HtmlWidget(
                            quizzDetail!.descriptionHtml ??
                                '<p style="color: grey; font-size: 16px; line-height: 1.5;">Aucune description disponible pour cette formation.</p>',
                            textStyle: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: theme.colorScheme.onSurface,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Comments header
                          BlocBuilder<CommentsBloc, CommentsState>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: CommentFieldWidget(
                                  isLoading: state.isSubmitting,
                                  onSend: (String text, File? file) {
                                    BlocProvider.of<CommentsBloc>(context).add(
                                      CommentsEvent.addCommentRequested(
                                        commentableType: commentTableType,
                                        commentableId: widget.quizzItem.id,
                                        attachmentPath: file?.path,
                                        body: text,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),

                          // Comments header + tiny list
                          ResumeCommentWidget(
                            commentableType: commentTableType,
                            commentableId: widget.quizzItem.id,
                            commentsCount: BlocProvider.of<CommentsBloc>(
                              context,
                              listen: true,
                            ).state.items.length,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),

                  // Bottom primary button
                  if (quizzDetail != null)
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            context.router.push(
                              QuizzRoute(quizzItem: quizzDetail!),
                            );
                          },
                          child: Text(
                            'OUVRIR',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: .2,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
      },
    );
  }
}

/* ---------- widgets ---------- */

class _MetaBlock extends StatelessWidget {
  const _MetaBlock({required this.label, required this.value, this.icon});

  final String label;
  final String value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: Colors.grey),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _StarRow extends StatelessWidget {
  const _StarRow({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= .5;

    final List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      IconData data;
      if (i < full) {
        data = Icons.star_rounded;
      } else if (i == full && hasHalf) {
        data = Icons.star_half_rounded;
      } else {
        data = Icons.star_border_rounded;
      }
      stars.add(Icon(data, color: const Color(0xFFFFB300), size: 22));
    }
    return Row(children: stars);
  }
}
