/* ---- Action ---- */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../domain/action/models/action_item.dart';
import '../../_commons/route/app_router.gr.dart';

class ActionCard extends StatelessWidget {
  final String badgeText;
  final Color badgeColor;
  final Color statusColor;
  final String title;
  final String status;
  final String owner;
  final bool inProgress;
  final int unreadBubble;
  final ActionItem action;

  const ActionCard({
    super.key,
    required this.badgeText,
    required this.badgeColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.owner,
    this.inProgress = true,
    this.unreadBubble = 0,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(fontWeight: FontWeight.w700);

    return InkWell(
      onTap: () {
        context.router.push(ActionDetailRoute(action: action));
      },
      child: _CardBase(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // badge + bulle
            Row(
              children: [
                Text(
                  badgeText,
                  style: style.copyWith(color: badgeColor, fontSize: 12),
                ),
                const Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Assets.svgs.message.svg(),
                    if (unreadBubble > 0)
                      Positioned(
                        right: -6,
                        top: -10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 15,
                            minHeight: 15,
                          ),
                          child: Center(
                            child: Text(
                              '$unreadBubble',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: style.copyWith(
                  fontSize: 15,
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    status,
                    style: GoogleFonts.poppins(
                      color: statusColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Responsable  ',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF6E7787),
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    owner,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
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

/* ============================= Cartes ============================= */

class _CardBase extends StatelessWidget {
  final Widget child;

  const _CardBase({required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1.5,
      borderRadius: BorderRadius.circular(14),
      child: Padding(padding: const EdgeInsets.all(12), child: child),
    );
  }
}
