/* ---- Event ---- */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/route/app_router.gr.dart';
import '../../_commons/utils/app_constants.dart';

class EventCard extends StatelessWidget {
  final String? imageUrl;
  final String level;
  final String status;
  final String title;
  final String? site;
  final void Function()? onTap;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.level,
    required this.status,
    required this.title,
    required this.site,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF2E6CF6);

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
        context.router.push(const BadEventsDetailRoute());
      },
      child: _CardBase(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl == null
                    ? AppConstants.tempImageNetwork
                    : AppConstants.getImageNetworkUrl(imageUrl!),
                width: 106,
                height: 102,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 4,
                  top: 2,
                  bottom: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // niveau + statut
                    Row(
                      children: [
                        Text(
                          level,
                          style: GoogleFonts.nunito(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Statut :  ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF6E7787),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          status,
                          style: GoogleFonts.nunito(
                            color: blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Text(
                            'Site :  ',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: const Color(0xFF6E7787),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              site ?? '',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
