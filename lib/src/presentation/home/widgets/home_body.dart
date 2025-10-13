import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../gen/assets.gen.dart';
import '../../../application/actions/actions_bloc.dart';
import '../../../application/audit/audits_bloc.dart';
import '../../../application/events/detail/event_detail_bloc.dart';
import '../../../application/events/events_bloc.dart';
import '../../../application/formation/formations_bloc.dart';
import '../../../application/inspection/inspections_bloc.dart';
import '../../../application/permit/permits_bloc.dart';
import '../../../application/slider/sliders_bloc.dart';
import '../../../domain/inspection/models/inspection_item.dart';
import '../../_commons/helpers/image_helper.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_shimmers/card_shimmer.dart';
import '../../actions/widget/action_card.dart';
import '../../audits/widgets/audits_widget.dart';
import '../../events/widgets/event_card.dart';
import '../../permis/widgets/hot_work_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _pageCtrl = PageController();
  late Timer _rotator;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _rotator = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted) return;
      final items = context.read<SlidersBloc>().state.items;
      if (items.isEmpty) return;
      _index = (_index + 1) % items.length;
      _pageCtrl.animateToPage(
        _index,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });

    BlocProvider.of<FormationsBloc>(
      context,
    ).add(const FormationsEvent.fetchMyFormationsRequested());
  }

  @override
  void dispose() {
    _rotator.cancel();
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Bannière rotative
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: BlocBuilder<SlidersBloc, SlidersState>(
                builder: (context, slidersState) {
                  final items = slidersState.items;
                  return Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: 16 / 7,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (items.isEmpty)
                                PageView.builder(
                                  controller: _pageCtrl,
                                  itemCount: 1,
                                  itemBuilder: (_, _) =>
                                      Container(color: Colors.black12),
                                )
                              else
                                PageView.builder(
                                  controller: _pageCtrl,
                                  itemCount: items.length,
                                  itemBuilder: (_, i) {
                                    final slider = items[i];
                                    return FutureBuilder<String>(
                                      future: getFullImageUrl(slider.image),
                                      builder: (context, snap) {
                                        final url = snap.data;
                                        if (url == null || url.isEmpty) {
                                          return Container(
                                            color: Colors.black12,
                                          );
                                        }
                                        return GestureDetector(
                                          onTap: () {
                                            if (slider.type == 'formation' &&
                                                slider.formation != null) {
                                              context.router.push(
                                                FormationDetailRoute(
                                                  formationId:
                                                      slider.formation!.id,
                                                ),
                                              );
                                            } else if (slider.type ==
                                                    'campaign' &&
                                                slider.campaign != null) {
                                              context.router.push(
                                                FormationsSensibilizationsRoute(
                                                  initialPage: 3,
                                                ),
                                              );
                                            }
                                          },
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Image.network(
                                                url,
                                                fit: BoxFit.cover,
                                              ),
                                              // Petite carte en bas à droite
                                              Positioned(
                                                bottom: 12,
                                                right: 12,
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                        maxWidth: 200,
                                                      ),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withValues(
                                                          alpha: 0.65,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        slider.titleFromType,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),

                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 2,
                                                            ),
                                                        child: Text(
                                                          slider
                                                              .subtitleFromType,
                                                          style:
                                                              GoogleFonts.dmSans(
                                                                color: Colors
                                                                    .white70,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (items.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              items.length,
                              (i) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i == _index
                                        ? AppColors.primary
                                        : Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),

          BlocBuilder<ActionsBloc, ActionsState>(
            builder: (context, state) {
              return _Section(
                icon: Assets.svgs.jamGreen,
                title: 'Actions',
                trailing: state.items == null
                    ? const SizedBox()
                    : _SeeAll(
                        countLabel: state.items!.length.toString(),
                        onTap: () {
                          context.router.push(const ActionsRoute());
                        },
                      ),
                children: state.items == null
                    ? List.generate(3, (index) => const CardShimmer())
                    : [
                        ...state.items!
                            .take(3)
                            .map(
                              (action) => ActionCard(
                                badgeText: action.echeanceText ?? '',
                                badgeColor: action.inProgressStatus
                                    ? AppColors.green
                                    : Colors.red,
                                title: action.justification ?? 'Sans titre',
                                status: action.humanReadableStatus ?? '',
                                owner: action.inChargeName ?? 'Non assignée',
                                inProgress: action.inProgressStatus,
                                unreadBubble: action.commentsCount ?? 0,
                                statusColor: action.badgeColor,
                                action: action,
                              ),
                            ),
                      ],
              );
            },
          ),

          BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) => _Section(
              icon: Assets.svgs.jamRed,
              title: 'Evenement non desirables',
              trailing: state.items == null
                  ? null
                  : _SeeAll(
                      countLabel: state.total.toString(),
                      onTap: () {
                        context.router.push(const NewBadEventsRoute());
                      },
                    ),
              children: state.items == null
                  ? List.generate(3, (index) => const CardShimmer())
                  : [
                      ...state.items!
                          .take(3)
                          .map(
                            (event) => EventCard(
                              onTap: () {
                                context.read<EventDetailsBloc>().add(
                                  EventDetailsEvent.getEvent(event: event),
                                );
                              },
                              imageUrl: event.attachments.isEmpty
                                  ? null
                                  : event.attachments.first,
                              level: event.humanGravity,
                              status: event.humanStatus,
                              title: event.title,
                              site: event.site,
                            ),
                          ),
                    ],
            ),
          ),

          BlocBuilder<InspectionsBloc, InspectionsState>(
            builder: (context, state) {
              return _Section(
                icon: Assets.svgs.jamBlue,
                title: 'Inspections',
                trailing: _SeeAll(
                  onTap: () {
                    context.router.push(const InspectionsRoute());
                  },
                ),
                children: state.items == null
                    ? List.generate(3, (index) => const CardShimmer())
                    : [
                        ...state.items!
                            .take(3)
                            .map(
                              (inspection) => _InspectionCard(
                                date: inspection.inspectedAt == null
                                    ? '---'
                                    : DateFormat('dd / MM / yy').format(
                                        DateTime.parse(inspection.inspectedAt!),
                                      ),
                                status: inspection.readableStatus,
                                title: () {
                                  final text = inspection.mission;
                                  final words = text.trim().split(
                                    RegExp(r'\s+'),
                                  );
                                  if (words.length <= 20) return text;
                                  return '${words.take(20).join(' ')}...';
                                }(),
                                site: inspection.summary ?? 'N/A',
                                statusColor: inspection.statusColorValue,
                                inspection: inspection,
                              ),
                            ),
                      ],
              );
            },
          ),

          BlocBuilder<AuditsBloc, AuditsState>(
            builder: (context, state) {
              return _Section(
                icon: Assets.svgs.jamOrange,
                title: 'Audits',
                trailing: _SeeAll(
                  onTap: () {
                    context.router.push(const AuditsRoute());
                  },
                ),
                children: state.items == null
                    ? List.generate(3, (index) => const CardShimmer())
                    : [
                        ...state.items!
                            .take(2)
                            .map(
                              (audit) => AuditCard(
                                audit: audit,
                                tag: audit.typeHumanReadable,
                                status: audit.statusHumanReadable,
                                title: audit.label,
                                process: audit.process?.title ?? 'N/A',
                              ),
                            ),
                      ],
              );
            },
          ),

          BlocBuilder<PermitsBloc, PermitsState>(
            builder: (context, state) {
              return _Section(
                icon: Assets.svgs.jamPurple,

                title: 'Permis à chaud',
                trailing: _SeeAll(
                  onTap: () {
                    context.router.push(const HotPermisRoute());
                  },
                ),
                children: state.items == null
                    ? List.generate(3, (index) => const CardShimmer())
                    : [
                        ...state.items!
                            .take(2)
                            .map(
                              (e) => HotWorkCard(
                                level: e.workTypeReadable,
                                status: e.statusHumanReadable,
                                title: e.title,
                                site: e.location ?? '---',
                                levelColor: const Color(0xFF7E59FF),
                                permit: e,
                              ),
                            ),
                      ],
              );
            },
          ),

          // fond pour respirer
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

/* ========================= Widgets de section ========================= */

class _Section extends StatelessWidget {
  final SvgGenImage icon;
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  const _Section({
    required this.icon,
    required this.title,
    this.trailing,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.dmSans(
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 20),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF3F9),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(child: icon.svg()),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: Text(title, style: titleStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
            // Items
            for (final w in children)
              Padding(padding: const EdgeInsets.only(bottom: 10), child: w),
          ],
        ),
      ),
    );
  }
}

class _SeeAll extends StatelessWidget {
  final String? countLabel;
  final void Function()? onTap;
  const _SeeAll({this.countLabel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final label = 'Voir tout';
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: label,
          children: [
            if (countLabel != null)
              TextSpan(
                text: ' ($countLabel)',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
          ],
        ),
        style: GoogleFonts.nunito(
          color: Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/* ============================= Cartes ============================= */

class _CardBase extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const _CardBase({
    required this.child,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1.5,
      borderRadius: BorderRadius.circular(14),
      child: Padding(padding: padding, child: child),
    );
  }
}

/* ---- Inspection ---- */
class _InspectionCard extends StatelessWidget {
  final String date;
  final String status;
  final String title;
  final String site;
  final Color statusColor;
  final InspectionItem inspection;

  const _InspectionCard({
    required this.date,
    required this.status,
    required this.title,
    required this.site,
    required this.statusColor,
    required this.inspection,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (inspection.cardAction == null) return;
        context.router.push(StartInspectionRoute(inspection: inspection));
      },
      child: _CardBase(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // date + statut
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.black45),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      date,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Statut :  ',
                  style: GoogleFonts.nunito(
                    color: const Color(0xFF6E7787),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Text(
                  status,
                  style: GoogleFonts.poppins(
                    color: statusColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Site :  ',
            //         style: GoogleFonts.nunito(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 13,
            //           color: const Color(0xFF6E7787),
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           site,
            //           style: GoogleFonts.nunito(
            //             fontWeight: FontWeight.w700,
            //             fontSize: 13,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
