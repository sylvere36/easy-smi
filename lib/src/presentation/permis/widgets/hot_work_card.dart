import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../domain/permit/models/permit_item.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_theme.dart';
import '../hot_permis_page.dart';

class HotWorkCard extends StatelessWidget {
  final String level;
  final Color levelColor;
  final String status;
  final String title;
  final String site;
  final PermitItem permit;

  const HotWorkCard({
    super.key,
    required this.level,
    required this.levelColor,
    required this.status,
    required this.title,
    required this.site,
    required this.permit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(HotPermisDetailRoute(permit: permit));
      },
      child: _CardBase(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // level + statut
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  decoration: BoxDecoration(
                    color: levelColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Text(
                      level,
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statut :  ',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color(0xFF6E7787),
                        ),
                      ),
                      Text(
                        status,
                        style: GoogleFonts.nunito(
                          color: permit.statusColorValue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          right: 8,
                          left: 8,
                        ),
                        child: Text(
                          title,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
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
                                site,
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

                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        showAuthorizeDialog(context);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.check, color: Colors.green),
                          Text(
                            'Autoriser',
                            style: GoogleFonts.dmSans(
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    PopupMenuItem(
                      onTap: () {
                        showStopDialog(context);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.close_rounded, color: Colors.red),
                          Text(
                            'Arrêter',
                            style: GoogleFonts.dmSans(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  icon: Assets.svgs.property.svg(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

Future<StopDialogResult?> showStopDialog(BuildContext context) {
  WorkStatus? status = WorkStatus.active;
  bool? q1 = true, q2 = true, q3 = true;

  return showDialog<StopDialogResult?>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      final cs = Theme.of(ctx).colorScheme;
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: StatefulBuilder(
          builder: (ctx, setState) => Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Arrêter', style: titleStyle(ctx))),
                      IconButton(
                        icon: const Icon(Icons.close_rounded, size: 28),
                        color: cs.onSurfaceVariant,
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _RadioGroup<WorkStatus>(
                    title:
                        'Tous les travaux associés à ce permis de travail à chaud ont été effectués :',
                    value: status,
                    items: const {
                      WorkStatus.active: 'Activé',
                      WorkStatus.cancelled: 'Annulé',
                      WorkStatus.suspended: 'Suspendu',
                    },
                    onChanged: (v) => setState(() => status = v),
                  ),
                  const SizedBox(height: 8),
                  _YesNo(
                    question:
                        "La zone de travail et les zones adjacentes ont été inspectées après l'achèvement des travaux et tous les dangers ont été éliminés :",
                    value: q1,
                    onChanged: (v) => setState(() => q1 = v),
                  ),
                  const SizedBox(height: 12),
                  _YesNo(
                    question:
                        "La zone de travail et la zone adjacente ont été inspectées pour vérifier la durée de la protection contre les incendies pendant au moins 30 minutes après l'achèvement du Travail à Chaud.",
                    value: q2,
                    onChanged: (v) => setState(() => q2 = v),
                  ),
                  const SizedBox(height: 12),
                  _YesNo(
                    question:
                        'Les équipements ont été vérifiés et remis en fonctionnement correctement.',
                    value: q3,
                    onChanged: (v) => setState(() => q3 = v),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: primaryBtn,
                    onPressed:
                        (status != null &&
                            q1 != null &&
                            q2 != null &&
                            q3 != null)
                        ? () => Navigator.pop(
                            ctx,
                            StopDialogResult(
                              status: status!,
                              zonesInspectees: q1!,
                              protection30min: q2!,
                              equipementsOk: q3!,
                            ),
                          )
                        : null,
                    child: Text(
                      'Confirmer',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _RadioGroup<T> extends StatelessWidget {
  const _RadioGroup({
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final String title;
  final T? value;
  final Map<T, String> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: bodyStyle(context)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 24,
          runSpacing: 8,
          children: items.entries.map((e) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<T>(value: e.key, groupValue: value, onChanged: onChanged),
                Text(e.value, style: GoogleFonts.inter(fontSize: 18)),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _YesNo extends StatelessWidget {
  const _YesNo({
    required this.question,
    required this.value,
    required this.onChanged,
  });
  final String question;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    final v = value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: bodyStyle(context)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 24,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<bool>(value: true, groupValue: v, onChanged: onChanged),
                Text('Oui', style: GoogleFonts.inter(fontSize: 18)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<bool>(value: false, groupValue: v, onChanged: onChanged),
                Text(
                  'Non',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
