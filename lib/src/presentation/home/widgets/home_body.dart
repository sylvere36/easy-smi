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
import '../../../application/inspection/inspections_bloc.dart';
import '../../../application/permit/permits_bloc.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_shimmers/action_card_shimmer.dart';
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
  final _banners = const [
    'https://picsum.photos/seed/smi1/1024/420',
    'https://picsum.photos/seed/smi2/1024/420',
    'https://picsum.photos/seed/smi3/1024/420',
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _rotator = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted) return;
      _index = (_index + 1) % _banners.length;
      _pageCtrl.animateToPage(
        _index,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });
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
              child: Column(
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
                          PageView.builder(
                            controller: _pageCtrl,
                            // onPageChanged: (i) {
                            //   setState(() {
                            //     _index = i;
                            //   });
                            // },
                            itemCount: _banners.length,
                            itemBuilder: (_, i) =>
                                Image.network(_banners[i], fit: BoxFit.cover),
                          ),
                          // petit indicateur en bas à droite
                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10),
                          //     child: Container(
                          //       padding: const EdgeInsets.symmetric(
                          //         horizontal: 10,
                          //         vertical: 6,
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Colors.black45,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: Text(
                          //         '${_index + 1}/${_banners.length}',
                          //         style: GoogleFonts.poppins(
                          //           color: Colors.white,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: GoogleFonts.nunito(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ],
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
                    ? const [
                        ActionCardShimmer(compact: true),
                        ActionCardShimmer(compact: true),
                        ActionCardShimmer(compact: true),
                      ]
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

  const _InspectionCard({
    required this.date,
    required this.status,
    required this.title,
    required this.site,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const StartInspectionRoute());
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
