import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../gen/assets.gen.dart';
import '../../../application/inspection/inspections_bloc.dart';
import '../../../domain/inspection/models/inspection_form_item.dart';
import '../../../domain/inspection/models/inspection_item.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_shimmers/card_shimmer.dart';

class InspectionsBody extends StatelessWidget {
  const InspectionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InspectionsBloc, InspectionsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
          children: [
            const _SectionHeader(label: 'Inspections'),
            // planning cards
            if (state.isLoading || state.items == null)
              ...List.generate(3, (index) => const CardShimmer()),
            if (state.items != null && state.items!.isEmpty)
              EmptyWidget.noData(),
            ...state.items?.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _PlanningCard(inspection: e),
                  ),
                ) ??
                [],

            // divider spacing (with padding only)
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 6),
              child: Container(height: 1, color: const Color(0x11000000)),
            ),

            const _SectionHeader(label: 'Fiches d\'inspection récentes'),

            if (state.isLoadingForms)
              ...List.generate(3, (index) => const CardShimmer()),
            if (state.forms.isEmpty) EmptyWidget.noData(),
            ...state.forms.map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: _RecentCard(item: e),
              ),
            ),
          ],
        );
      },
    );
  }
}

/* =========================  UI WIDGETS  ========================= */

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Row(
          children: [
            Assets.svgs.jamBlue.svg(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanningCard extends StatelessWidget {
  final InspectionItem inspection;
  const _PlanningCard({required this.inspection});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (inspection.cardAction == null) return;
        context.router.push(StartInspectionRoute(inspection: inspection));
      },
      child: Container(
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
              child: Row(
                children: [
                  _chipDate(
                    inspection.inspectedAt == null
                        ? '---'
                        : DateFormat(
                            'dd / MM / yy',
                          ).format(DateTime.parse(inspection.inspectedAt!)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Statut : ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            inspection.readableStatus,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: inspection.statusColorValue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Text(
                () {
                  final text = inspection.mission;
                  final words = text.trim().split(RegExp(r'\s+'));
                  if (words.length <= 20) return text;
                  return '${words.take(20).join(' ')}...';
                }(),
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            // site
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            //   child: Row(
            //     children: [
            //       const Text(
            //         'Site : ',
            //         style: TextStyle(color: Colors.black54),
            //       ),
            //       Text(
            //         item.site,
            //         style: const TextStyle(fontWeight: FontWeight.w700),
            //       ),
            //     ],
            //   ),
            // ),

            // bottom action bar
            Container(
              decoration: inspection.cardAction != null
                  ? const BoxDecoration(
                      border: Border(top: BorderSide(color: Color(0xFFE7E7E7))),
                    )
                  : null,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    _actionButton(inspection.cardAction),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(CardAction? a) {
    if (a == null) {
      return Container();
    }
    switch (a.kind) {
      case ActionKind.continueFlow:
        return _pillButton(
          label: 'CONTINUER',
          bg: const Color(0xFFE3EDFF),
          fg: const Color(0xFF1E5AF9),
          icon: Icons.play_circle_fill_rounded,
        );
      case ActionKind.startFlow:
        return _pillButton(
          label: 'DEMMARER',
          bg: const Color(0xFFE3EDFF),
          fg: const Color(0xFF1E5AF9),
          icon: Icons.play_circle_fill_rounded,
        );
      case ActionKind.countdown:
        return _pillButton(
          label: a.countdownText ?? '',
          bg: const Color(0xFFF1F1F6),
          fg: Colors.black87,
          icon: Icons.hourglass_bottom_rounded,
        );
    }
  }

  Widget _pillButton({
    required String label,
    required Color bg,
    required Color fg,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 10, 8),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: fg,
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(icon, size: 20, color: fg),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentCard extends StatelessWidget {
  final InspectionFormItem item;
  const _RecentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(InpectionRecentDetailRoute(item: item));
      },
      child: Container(
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(12),
                    color: item.statusColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        item.humanizedStatus,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8),
                  //     child: Align(
                  //       alignment: Alignment.centerRight,
                  //       child: _commentBubble(count: item.comments),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
              child: Text(
                (() {
                  final raw = (item.description ?? '---').trim();
                  if (raw.isEmpty) return '---';
                  final words = raw.split(RegExp(r'\s+'));
                  if (words.length <= 30) return raw;
                  return '${words.take(30).join(' ')}...';
                })(),
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            // site
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(12, 8, 12, 14),
            //   child: Row(
            //     children: [
            //       const Text(
            //         'Site : ',
            //         style: TextStyle(color: Colors.black54),
            //       ),
            //       Text(
            //         item.site,
            //         style: const TextStyle(fontWeight: FontWeight.w700),
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

/* =========================  SMALL ATOMS  ========================= */

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(14),
  boxShadow: const [
    BoxShadow(color: Color(0x15000000), blurRadius: 8, offset: Offset(0, 2)),
  ],
);

Widget _chipDate(String text) {
  return Container(
    decoration: const BoxDecoration(color: Colors.black54),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    ),
  );
}
