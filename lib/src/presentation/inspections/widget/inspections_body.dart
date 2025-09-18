import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

class InspectionsBody extends StatelessWidget {
  const InspectionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final planning = [
      InspectionItem(
        date: '22 / 08 / 25',
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
        site: 'Espace vert du PAC',
        statusLabel: 'En cours',
        statusColor: AppColors.primary,
        action: const CardAction.continueFlow(),
      ),
      InspectionItem(
        date: '11 / 09 / 25',
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
        site: 'Espace vert du PAC',
        statusLabel: 'En cours',
        statusColor: AppColors.primary,
        action: const CardAction.startFlow(),
      ),
      InspectionItem(
        date: '30 / 01 / 26',
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
        site: 'Espace vert du PAC',
        statusLabel: 'Programmé',
        statusColor: const Color(0xFF02B088),
        action: const CardAction.countdown('04 JOUR(S)'),
      ),
    ];

    final recents = [
      RecentItem(
        date: '22 / 09 / 25',
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
        site: 'Espace vert du PAC',
        comments: 1,
      ),
      RecentItem(
        date: '22 / 09 / 25',
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
        site: 'Espace vert du PAC',
        comments: 3,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
      children: [
        const _SectionHeader(label: 'Planning'),
        // planning cards
        ...planning.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _PlanningCard(item: e),
          ),
        ),

        // divider spacing (with padding only)
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 6),
          child: Container(height: 1, color: const Color(0x11000000)),
        ),

        const _SectionHeader(label: 'Inspections recentes'),
        ...recents.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _RecentCard(item: e),
          ),
        ),
      ],
    );
  }
}

/* =========================  DATA MODELS  ========================= */

class InspectionItem {
  final String date;
  final String title;
  final String site;
  final String statusLabel;
  final Color statusColor;
  final CardAction action;
  InspectionItem({
    required this.date,
    required this.title,
    required this.site,
    required this.statusLabel,
    required this.statusColor,
    required this.action,
  });
}

class CardAction {
  final _ActionKind kind;
  final String? countdownText;
  const CardAction._(this.kind, [this.countdownText]);

  const CardAction.continueFlow() : this._(_ActionKind.continueFlow);
  const CardAction.startFlow() : this._(_ActionKind.startFlow);
  const CardAction.countdown(String text) : this._(_ActionKind.countdown, text);
}

enum _ActionKind { continueFlow, startFlow, countdown }

class RecentItem {
  final String date;
  final String title;
  final String site;
  final int comments;
  RecentItem({
    required this.date,
    required this.title,
    required this.site,
    required this.comments,
  });
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
  final InspectionItem item;
  const _PlanningCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const StartInspectionRoute());
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
                  _chipDate(item.date),
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
                            item.statusLabel,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: item.statusColor,
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
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            // site
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
              child: Row(
                children: [
                  const Text(
                    'Site : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    item.site,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            // bottom action bar
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFE7E7E7))),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    _actionButton(item.action),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(CardAction a) {
    switch (a.kind) {
      case _ActionKind.continueFlow:
        return _pillButton(
          label: 'CONTINUER',
          bg: const Color(0xFFE3EDFF),
          fg: const Color(0xFF1E5AF9),
          icon: Icons.play_circle_fill_rounded,
        );
      case _ActionKind.startFlow:
        return _pillButton(
          label: 'DEMMARER',
          bg: const Color(0xFFE3EDFF),
          fg: const Color(0xFF1E5AF9),
          icon: Icons.play_circle_fill_rounded,
        );
      case _ActionKind.countdown:
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
  final RecentItem item;
  const _RecentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const InpectionRecentDetailRoute());
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
                  _chipDate(item.date),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _commentBubble(count: item.comments),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            // site
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 14),
              child: Row(
                children: [
                  const Text(
                    'Site : ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    item.site,
                    style: const TextStyle(fontWeight: FontWeight.w700),
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

Widget _commentBubble({required int count}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Assets.svgs.message.svg(),
      Positioned(
        right: -6,
        top: -6,
        child: Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: Color(0xFFFF2B2B),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    ],
  );
}
