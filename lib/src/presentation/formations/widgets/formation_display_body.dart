// removed unused import

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../injection_container.dart';
import '../../../application/communication/comments_bloc.dart';
import '../../../application/formation/detail/formation_detail_bloc.dart';
import '../../../application/formation/formations_bloc.dart';
import '../../../domain/_commons/global_failure.dart';
import '../../../domain/formation/models/formation_course.dart';
import '../../../domain/formation/models/my_formation.dart';
import '../../_commons/helpers/html_view.dart';
import '../../_commons/helpers/image_helper.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/comments/comment_field.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/my_toast.dart';
import '../../_commons_widgets/network_video_viewer.dart';
import '../../comments/widgets/resume_comment_widget.dart';

class CourseDisplayBody extends StatefulWidget {
  final int formationId;
  const CourseDisplayBody({super.key, required this.formationId});

  @override
  State<CourseDisplayBody> createState() => _CourseDisplayBodyState();
}

class _CourseDisplayBodyState extends State<CourseDisplayBody>
    with TickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 3, vsync: this);
  MyFormation? myFormation;

  String commentTableType = 'formation';

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FormationsBloc>(
      context,
    ).add(const FormationsEvent.fetchMyFormationsRequested());
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> openVideoViewer({
    required String url,
    required String thumb,
    required FormationCourse lesson,
    required bool isCurrent,
    required bool isDone,
  }) async {
    // if (widget.isDone) return;
    final String btnTitle = isCurrent
        ? 'Terminer la leçon'
        : 'Démarrer la leçon';

    await showNetworkVideoViewer(
      context,
      url: thumb,
      hasBtn: !isDone,
      btnTitle: btnTitle,
      onPressed: () {
        context.read<FormationDetailBloc>().add(
          isCurrent
              ? FormationDetailEvent.finishCourseRequested(id: lesson.id)
              : FormationDetailEvent.startCourseRequested(id: lesson.id),
        );

        successToast(
          context: context,
          msg: isCurrent ? 'Leçon terminée' : 'Leçon démarrée',
        );
        if (isCurrent) {
          setState(() {
            myFormation?.currentLesson = lesson.id;
            if (myFormation!.lessonsDone == null) {
              myFormation!.lessonsDone = [];
            }
            myFormation!.lessonsDone!.add(lesson.id.toString());
            myFormation!.totalLessonsDone += 1;
          });
          AutoRouter.of(context).pop();
        } else {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    return BlocProvider(
      create: (context) => sl<FormationDetailBloc>()
        ..add(FormationDetailEvent.fetchRequested(id: widget.formationId))
        ..add(FormationDetailEvent.coursesRequested(id: widget.formationId)),
      child: BlocConsumer<FormationsBloc, FormationsState>(
        listener: (context, state) {
          if (state.itemsMyFormations.isNotEmpty) {
            final found = state.itemsMyFormations.firstWhere(
              (f) => f.formation.id == widget.formationId,
              orElse: () => state.itemsMyFormations.first,
            );
            setState(() {
              myFormation = found;
            });

            context.read<CommentsBloc>().add(
              CommentsEvent.fetchRequested(
                commentableType: commentTableType,
                commentableId: myFormation!.formation.id,
              ),
            );
            if (found.formation.id != widget.formationId) {
              errorToast(context: context, msg: 'Formation introuvable');
              context.router.pop();
            }
          }
        },
        builder: (context, state) {
          return BlocListener<FormationDetailBloc, FormationDetailState>(
            listener: (context, detailState) {
              detailState.finishFormationResultOption.fold(
                () {},
                (either) => either.fold(
                  (l) {
                    final msg = l.customMap(
                      serverError: (e) => e.errorText ?? 'Erreur serveur',
                      unauthorized: (_) => 'Non autorisé',
                      noNetwork: (_) => 'Pas de connexion',
                    );
                    errorToast(context: context, msg: msg);
                  },
                  (r) {
                    successToast(context: context, msg: 'Formation finalisée');
                    // Refresh my-formations list to reflect new status
                    context.read<FormationsBloc>().add(
                      const FormationsEvent.fetchMyFormationsRequested(),
                    );
                  },
                ),
              );
            },
            child: BlocBuilder<FormationDetailBloc, FormationDetailState>(
              builder: (context, state) {
                return state.isLoading || myFormation == null
                    ? const Center(child: LoadingWidget())
                    : DefaultTabController(
                        length: 4,
                        child: NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                            // IMAGE + titre + stats + CTA
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Header image
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      8,
                                      12,
                                      8,
                                      12,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await openVideoViewer(
                                          url: state.item?.imageUrl ?? '',
                                          thumb: state.item?.imageUrl ?? '',
                                          lesson: myFormation!.getCurrentCourse(
                                            state.courses,
                                          )!,
                                          isCurrent:
                                              myFormation!.currentLesson ==
                                              myFormation!
                                                  .getCurrentCourse(
                                                    state.courses,
                                                  )!
                                                  .id,
                                          isDone:
                                              myFormation!.lessonsDone
                                                  ?.contains(
                                                    myFormation!
                                                        .getCurrentCourse(
                                                          state.courses,
                                                        )!
                                                        .id
                                                        .toString(),
                                                  ) ??
                                              false,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            FutureBuilder<String>(
                                              future: getFullImageUrl(
                                                state.item?.imageUrl ?? '',
                                              ),
                                              builder:
                                                  (context, asyncSnapshot) {
                                                    if (asyncSnapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const Center(
                                                        child: LoadingWidget(),
                                                      );
                                                    } else if (asyncSnapshot
                                                        .hasError) {
                                                      return const Center(
                                                        child: Icon(
                                                          Icons.error,
                                                        ),
                                                      );
                                                    } else {
                                                      return AspectRatio(
                                                        aspectRatio: 16 / 9,
                                                        child: Image.network(
                                                          asyncSnapshot.data!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Title
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      0,
                                      16,
                                      8,
                                    ),
                                    child: Text(
                                      state.item?.title ?? '',
                                      style: GoogleFonts.inter(
                                        fontSize: 22,
                                        height: 1.25,
                                        fontWeight: FontWeight.w700,
                                        color: onSurface,
                                      ),
                                    ),
                                  ),

                                  // Progress + text right
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: LinearProgressIndicator(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            minHeight: 8,
                                            value:
                                                myFormation?.progress ??
                                                0, // 06 / 10
                                            backgroundColor: Colors.black12,
                                            valueColor:
                                                const AlwaysStoppedAnimation(
                                                  AppColors.primary,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '${(myFormation?.totalLessonsDone ?? 0).toString().padLeft(2)} / ${(myFormation?.totalLessons ?? 0).toString().padLeft(2)} terminé',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // CTA "Leçon 7"
                                  if (!myFormation!.isCompleted)
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16,
                                        14,
                                        16,
                                        16,
                                      ),
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size.fromHeight(
                                            52,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          elevation: 0,
                                        ),
                                        icon: const Icon(
                                          Icons.play_circle_fill_rounded,
                                        ),
                                        label: Text(
                                          'Leçon ${myFormation?.myCurrentLesson(state.courses)}',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        onPressed: () async {
                                          await openVideoViewer(
                                            url: state.item?.imageUrl ?? '',
                                            thumb: state.item?.imageUrl ?? '',
                                            lesson: myFormation!
                                                .getCurrentCourse(
                                                  state.courses,
                                                )!,
                                            isCurrent:
                                                myFormation!.currentLesson ==
                                                myFormation!
                                                    .getCurrentCourse(
                                                      state.courses,
                                                    )!
                                                    .id,
                                            isDone:
                                                myFormation!.lessonsDone
                                                    ?.contains(
                                                      myFormation!
                                                          .getCurrentCourse(
                                                            state.courses,
                                                          )!
                                                          .id
                                                          .toString(),
                                                    ) ??
                                                false,
                                          );
                                        },
                                      ),
                                    ),

                                  // Finalize formation button
                                  if (myFormation!.canFinalize)
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16,
                                        10,
                                        30,
                                        16,
                                      ),
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size.fromHeight(
                                            52,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          elevation: 0,
                                        ),
                                        icon: state.isFinishingFormation == true
                                            ? const SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: LoadingWidget(
                                                  color: Colors.black,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.flag_circle_rounded,
                                              ),
                                        label: Text(
                                          'Finaliser la formation',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        onPressed:
                                            state.isFinishingFormation == true
                                            ? null
                                            : () {
                                                context
                                                    .read<FormationDetailBloc>()
                                                    .add(
                                                      FormationDetailEvent.finishFormationRequested(
                                                        id: widget.formationId,
                                                      ),
                                                    );
                                              },
                                      ),
                                    ),

                                  // Chips des infos (leçons, durée, inscrits)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      10,
                                      16,
                                      12,
                                    ),
                                    child: _InfoColumn(
                                      myFormation: myFormation!,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ===== Sticky TabBar juste sous l’AppBar =====
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: _TabBarHeaderDelegate(
                                TabBar(
                                  controller: _tabs,
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  indicatorWeight: 3,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  unselectedLabelStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const [
                                    Tab(text: 'Aperçu'),
                                    Tab(text: 'Leçons'),
                                    // Tab(text: 'Ressources'),
                                    Tab(text: 'Temoignages'),
                                  ],
                                ),
                              ),
                            ),
                          ],

                          // ===== Contenu scrollable de chaque tab =====
                          body: TabBarView(
                            controller: _tabs,
                            children: [
                              // APERÇU
                              _OverviewTab(myFormation: myFormation!),

                              // LEÇONS
                              _LessonsTab(
                                lessons: state.courses,
                                myFormation: myFormation!,
                                onLessonTap: (lesson) async {
                                  await openVideoViewer(
                                    url: lesson.media,
                                    thumb: lesson.media,
                                    lesson: lesson,
                                    isCurrent:
                                        myFormation!.currentLesson == lesson.id,
                                    isDone:
                                        myFormation!.lessonsDone?.contains(
                                          lesson.id.toString(),
                                        ) ??
                                        false,
                                  );
                                },
                              ),

                              // RESSOURCES
                              // _ResourcesTab(),

                              // TÉMOIGNAGES
                              _ReviewsTab(
                                id: myFormation!.formation.id,
                                commentTableType: commentTableType,
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}

// --------------------------- widgets de sections -----------------------------

class _OverviewTab extends StatelessWidget {
  final MyFormation myFormation;

  const _OverviewTab({super.key, required this.myFormation});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      shrinkWrap: true,
      children: [
        Text(
          'RESUME',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            letterSpacing: .3,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 500,
          child: HtmlView(html: myFormation.formation.descriptionHtml),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _LessonsTab extends StatelessWidget {
  final List<FormationCourse> lessons;
  final MyFormation myFormation;
  final Function(FormationCourse lesson) onLessonTap;
  const _LessonsTab({
    super.key,
    required this.lessons,
    required this.myFormation,
    required this.onLessonTap,
  });
  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.25,
    );
    final subtitle = GoogleFonts.inter(
      fontSize: 12,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        const SizedBox(height: 8),

        ...lessons.asMap().entries.map((entry) {
          final i = entry.key;
          final lesson = entry.value;
          return FutureBuilder(
            future: getVideoDurationLabel(lesson.media),
            builder: (context, asyncSnapshot) {
              return _LessonTile(
                thumb: lesson.media,
                title: lesson.title,
                duration: asyncSnapshot.data ?? '00:00',
                isDone:
                    myFormation.lessonsDone?.contains(lesson.id.toString()) ??
                    false,
                index: (i + 1).toString(),
                titleStyle: title,
                subtitleStyle: subtitle,
                isCurrent: myFormation.currentLesson == lesson.id,
                lesson: lesson,
                onTap: () async {
                  onLessonTap(lesson);
                },
              );
            },
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }
}

// class _ResourcesTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final label = GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700);
//     return ListView(
//       padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
//       children: [
//         Text('Livrets d’exercices', style: label),
//         const SizedBox(height: 12),
//         ...List.generate(2, (i) => _PdfCard()),
//       ],
//     );
//   }
// }

class _ReviewsTab extends StatelessWidget {
  final String commentTableType;
  final int id;
  const _ReviewsTab({
    super.key,
    required this.id,
    required this.commentTableType,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
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
                      commentableId: id,
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
          commentableId: id,
          commentsCount: BlocProvider.of<CommentsBloc>(
            context,
            listen: true,
          ).state.items.length,
          take: 10,
        ),
      ],
    );
  }
}

// --------------------------- petits composants -------------------------------

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TabBarHeaderDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => 52;
  @override
  double get maxExtent => 52;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (overlapsContent)
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.only(left: 8), child: tabBar),
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarHeaderDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar;
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({required this.myFormation});
  final MyFormation myFormation;

  @override
  Widget build(BuildContext context) {
    final chipText = GoogleFonts.inter(fontWeight: FontWeight.w700);

    Widget chip(IconData icon, String t1) {
      return Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Text(t1, style: chipText),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 10,
        children: [
          chip(Icons.menu_book_rounded, '${myFormation.totalLessons} leçons'),
          chip(
            Icons.schedule_rounded,
            '${myFormation.formation.durationMinutes} minutes',
          ),
          chip(
            Icons.people_alt_rounded,
            '${myFormation.formation.maxParticipants} personnes ',
          ),
        ],
      ),
    );
  }
}

// removed unused _SectionHeader

class _LessonTile extends StatefulWidget {
  const _LessonTile({
    required this.thumb,
    required this.title,
    required this.index,
    required this.duration,
    required this.isDone,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.isCurrent,
    required this.lesson,
    required this.onTap,
  });

  final String thumb, title, duration, index;
  final bool isDone, isCurrent;
  final TextStyle titleStyle, subtitleStyle;
  final FormationCourse lesson;

  final VoidCallback onTap;

  @override
  State<_LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<_LessonTile> {
  bool isSelect = false;
  @override
  void initState() {
    super.initState();
    isSelect = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    final thumbUrl = resolveVideoThumbnail(widget.thumb);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    thumbUrl,
                    width: 210,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      width: 210,
                      height: 110,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                if (isSelect)
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Leçon ${widget.index}', style: widget.subtitleStyle),
                  const SizedBox(height: 3),
                  Text(widget.title, style: widget.titleStyle),
                  const SizedBox(height: 6),
                  FutureBuilder<String>(
                    future: getVideoDurationLabel(widget.thumb),
                    builder: (context, snapshot) {
                      final label = snapshot.data ?? widget.duration;
                      return Text(label, style: widget.subtitleStyle);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
