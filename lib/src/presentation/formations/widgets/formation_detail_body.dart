import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../injection_container.dart';
import '../../../application/formation/detail/formation_detail_bloc.dart';
import '../../../application/formation/formations_bloc.dart';
import '../../../domain/formation/models/formation_course.dart';
import '../../../domain/formation/models/my_formation.dart';
import '../../_commons/helpers/image_helper.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/my_toast.dart';
import 'formation_registration_sheet.dart';

class CourseBody extends StatefulWidget {
  final int formationId;
  const CourseBody({super.key, required this.formationId});

  @override
  State<CourseBody> createState() => _CourseBodyState();
}

class _CourseBodyState extends State<CourseBody> {
  bool readMore = false;

  MyFormation? myFormation;

  // --- Fake data ---

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FormationsBloc>(
      context,
    ).add(const FormationsEvent.fetchMyFormationsRequested());
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      height: 1.2,
    );
    final text = GoogleFonts.poppins(
      fontSize: 15,
      color: Colors.black87,
      height: 1.45,
    );

    return BlocProvider(
      create: (context) => sl<FormationDetailBloc>()
        ..add(FormationDetailEvent.fetchRequested(id: widget.formationId))
        ..add(FormationDetailEvent.coursesRequested(id: widget.formationId)),
      child: BlocListener<FormationsBloc, FormationsState>(
        listener: (context, state) {
          if (state.itemsMyFormations.isNotEmpty) {
            MyFormation? found;
            for (var i = 0; i < state.itemsMyFormations.length; i++) {
              if (state.itemsMyFormations[i].formation.id ==
                  widget.formationId) {
                found = state.itemsMyFormations[i];
                break;
              }
            }
            setState(() {
              myFormation = found;
            });
          }
        },
        child: BlocBuilder<FormationDetailBloc, FormationDetailState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(child: LoadingWidget())
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header image + Play
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                FutureBuilder<String>(
                                  future: getFullImageUrl(
                                    state.item?.imageUrl ?? '',
                                  ),
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

                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            state.item?.title ?? '---',
                            style: titleStyle,
                          ),
                        ),

                        // Description + Lire la suite
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HtmlWidget(
                                state.item?.descriptionHtml ?? '',
                                textStyle: text,
                              ),
                              // TextButton(
                              //   onPressed: () =>
                              //       setState(() => readMore = !readMore),
                              //   child: Text(
                              //     readMore ? 'Lire moins' : 'Lire la suite',
                              //     style: GoogleFonts.poppins(
                              //       color: const Color(0xFF0B65E3),
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        // Metrics
                        _MetricRow(
                          leading: Icons.groups_rounded,
                          label: '${state.item?.maxParticipants} participants',
                        ),
                        _MetricRow(
                          leading: Icons.person_outline,
                          label: 'Formateur',
                          value: '${state.item?.trainer.name}',
                        ),
                        _MetricRow(
                          leading: Icons.verified_outlined,
                          label: 'Certificat',
                          value: state.item?.certification == true
                              ? 'Oui'
                              : 'Non',
                        ),
                        _MetricRow(
                          leading: Icons.public_outlined,
                          label: 'Type',
                          value: state.item?.deliveryMode == 'online'
                              ? 'En ligne'
                              : 'Présentiel',
                        ),

                        // CTA
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1663D6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed: () {
                                if (myFormation != null) {
                                  context.router.popAndPush(
                                    FormationDisplayRoute(
                                      formationId: widget.formationId,
                                    ),
                                  );
                                } else {
                                  if (state.courses.isEmpty) {
                                    errorToast(
                                      context: context,
                                      msg: 'Aucun cours disponible',
                                    );
                                    return;
                                  }
                                  FormationRegistrationSheet.show(
                                    context: context,
                                    formationId: widget.formationId,
                                    firstCourse: state.courses.isNotEmpty
                                        ? state.courses[0]
                                        : null,
                                  );
                                }
                              },
                              child: Text(
                                myFormation == null
                                    ? 'S\'inscrire'.toUpperCase()
                                    : 'CONTINUER'.toUpperCase(),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Ce que vous apprendrez
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
                          child: Text(
                            'Ce que vous apprendrez',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ...state.item?.learningOutcomes.isNotEmpty == true
                            ? state.item!.learningOutcomes.map(
                                (e) => _Bullet(text: e),
                              )
                            : const [],

                        // Programme header line
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 1),
                          child: Text(
                            'Programme',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 1, 16, 0),
                          child: _SectionHeader(
                            title: '',
                            initExpand: true,
                            body: Column(
                              children: List.generate(
                                state.courses.length,
                                (i) => _LessonTile(
                                  index: i + 1,
                                  lesson: state.courses[i],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

/// ---- Small pieces ----

class _MetricRow extends StatelessWidget {
  final IconData leading;
  final String label;
  final String? value;
  const _MetricRow({required this.leading, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    final grey = Colors.black87.withValues(alpha: .7);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Row(
        children: [
          Icon(leading, size: 22, color: grey),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (value != null) ...[
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                value!,
                style: GoogleFonts.poppins(color: Colors.black87),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) {
    final fg = Colors.black87;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF5C7CFF)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(color: fg, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatefulWidget {
  final String title;
  final Widget body;
  final bool initExpand;
  const _SectionHeader({
    required this.title,
    required this.body,
    this.initExpand = false,
  });

  @override
  State<_SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<_SectionHeader> {
  bool isExpand = false;
  @override
  void initState() {
    super.initState();
    isExpand = widget.initExpand;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isExpand,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
            child: widget.body,
          ),
        ),
      ],
    );
  }
}

class _LessonTile extends StatelessWidget {
  final int index;
  final FormationCourse lesson;
  const _LessonTile({required this.index, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 15.5,
    );
    // final sub = GoogleFonts.poppins(color: Colors.black54, fontSize: 13);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString(),
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lesson.title, style: title),
                // Padding(
                //   padding: const EdgeInsets.only(top: 2),
                //   child: Text(lesson.duration, style: sub),
                // ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.play_arrow_rounded, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
