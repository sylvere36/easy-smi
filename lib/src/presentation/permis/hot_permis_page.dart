import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/permit/permits_bloc.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons/theming/app_theme.dart';
import '../_commons_widgets/empty_widget.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_shimmers/card_shimmer.dart';
import 'widgets/hot_work_card.dart';

@RoutePage()
class HotPermisPage extends StatelessWidget {
  static const String routeName = '/hot-permis';
  const HotPermisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermitsBloc, PermitsState>(
      builder: (context, state) {
        return MyScaffold(
          appBarTitle: 'PERMIS A CHAUD',
          body: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                if (state.isLoading || state.items == null)
                  ...List.generate(6, (index) => const CardShimmer()),
                if (state.items != null && state.items!.isEmpty)
                  EmptyWidget.noData(),
                ...state.items?.map(
                      (e) => HotWorkCard(
                        level: e.workTypeReadable,
                        status: e.statusHumanReadable,
                        title: e.title,
                        site: e.location ?? '---',
                        levelColor: const Color(0xFF7E59FF),
                        permit: e,
                      ),
                    ) ??
                    [const SizedBox.shrink()],

                //   List.generate(
                //   8,
                //   (index) => const _HotWorkCard(
                //     level: 'Travail dangereux',
                //     status: 'En cours',
                //     title:
                //         'Permis pour les travaux sur le quai du bateau de dechargements des marchandises',
                //     site: 'Espace vert du PAC',
                //     levelColor: Color(0xFF7E59FF),
                //   ),
                // )
              ],
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              context.router.push(const AddHotPermisRoute());
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.note_rounded, color: Colors.white, size: 25),
                  Text(
                    'Declarer',
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// ----------------------------------------------
///  DIALOG #1 : AUTORISER
/// ----------------------------------------------
class AuthorizeResult {
  final bool accepteConditions;
  final bool autoriseSousReserve;
  const AuthorizeResult(this.accepteConditions, this.autoriseSousReserve);
}

Future<AuthorizeResult?> showAuthorizeDialog(BuildContext context) {
  bool a = false, b = false;

  return showDialog<AuthorizeResult?>(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Autoriser', style: titleStyle(ctx))),
                    IconButton(
                      icon: const Icon(Icons.close_rounded, size: 28),
                      color: cs.onSurfaceVariant,
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _CheckParagraph(
                  value: a,
                  onChanged: (v) => setState(() => a = v ?? false),
                  text:
                      "J'accepte ce Permis, je suis d'accord avec les conditions détaillées ci-dessus et la/les procédure(s) associée(s), et j'accepte la responsabilité en tant que personne directement en charge du travail désigné. J'ai lu les évaluations des risques / l'analyse de la sécurité du travail et les procédures ci-jointes et j'ai observé les contrôles des risques en place.",
                ),
                const SizedBox(height: 20),
                _CheckParagraph(
                  value: b,
                  onChanged: (v) => setState(() => b = v ?? false),
                  text:
                      "J'autorise le travail à chaud sous réserve des conditions/précautions de l'évaluation des risques/de l'analyse des tâches indiquées sur ce Permis.",
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: primaryBtn,
                  onPressed: (a && b)
                      ? () => Navigator.pop(ctx, AuthorizeResult(a, b))
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
      );
    },
  );
}

class _CheckParagraph extends StatelessWidget {
  const _CheckParagraph({
    required this.value,
    required this.onChanged,
    required this.text,
  });
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(0, 2),
          child: SizedBox(
            width: 28,
            height: 28,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: bodyStyle(context))),
      ],
    );
  }
}

/// ----------------------------------------------
///  DIALOG #2 : ARRÊTER
/// ----------------------------------------------
enum WorkStatus { active, cancelled, suspended }

class StopDialogResult {
  final WorkStatus status;
  final bool zonesInspectees;
  final bool protection30min;
  final bool equipementsOk;
  const StopDialogResult({
    required this.status,
    required this.zonesInspectees,
    required this.protection30min,
    required this.equipementsOk,
  });
}
