import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../injection_container.dart';
import '../../../application/actions/detail/action_detail_bloc.dart';
import '../../../domain/action/models/action_item.dart';
import '../../../domain/action/models/action_task.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/comments/comment_line.dart';
import '../../_commons_widgets/custom_chip_widget.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';

class ActionDetailBody extends StatefulWidget {
  final ActionItem action;
  const ActionDetailBody({super.key, required this.action});

  @override
  State<ActionDetailBody> createState() => _ActionDetailBodyState();
}

class _ActionDetailBodyState extends State<ActionDetailBody> {
  final TextEditingController _commentCtrl = TextEditingController();

  void _openReportSheet() => _openBottomSheet(
    context,
    title: 'Rapport',
    firstLabel: 'Conclusion',
    onSubmit: () => Navigator.pop(context),
  );

  void _openAddPlanningSheet() => _openBottomSheet(
    context,
    title: 'Ajouter',
    firstLabel: 'Operationnalisation / Planning',
    onSubmit: () => Navigator.pop(context),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActionDetailBloc>()
        ..add(ActionDetailEvent.fetchRequested(id: widget.action.id))
        ..add(ActionDetailEvent.tasksRequested(actionId: widget.action.id)),
      child: BlocConsumer<ActionDetailBloc, ActionDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                // Title block
                _titleBlock(widget.action),

                // Composer + attachments icon
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: _roundedField(
                          child: TextField(
                            controller: _commentCtrl,
                            decoration: InputDecoration(
                              hintText: 'Ecrire  un commentaire',
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.sub,
                              ),
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                            ),
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: _roundIcon(
                          Icons.attach_file_rounded,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                // Comments header + tiny list
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        'Commentaire(s)',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _tinyCounter(2),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.router.push(const CommentsRoute());
                        },
                        child: Text(
                          'Voir tout',
                          style: GoogleFonts.poppins(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                commentLine(
                  'Beatrice BOSSOU',
                  'Il y a 30 min',
                  'Les documents fournies ne respectent par les normes internationnales',
                ),
                commentLine(
                  'Beatrice BOSSOU',
                  'Il y a 30 min',
                  'Les documents fournies ne respectent par les normes internationnales',
                ),

                // Section: Operationnalisation / Planning
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: _sectionCard(
                    title: 'Operationnalisation / Planning',
                    onAdd: _openAddPlanningSheet,
                    // trailing: appColorsillButton(
                    //   'Ajouter',
                    //   icon: Icons.add,
                    //   onTap: _openAddPlanningSheet,
                    // ),
                    child: BlocBuilder<ActionDetailBloc, ActionDetailState>(
                      builder: (context, state) {
                        return state.isTasksLoading == true
                            ? const Center(child: LoadingWidget())
                            : state.tasks.isEmpty
                            ? EmptyWidget.noTasks()
                            : Column(
                                children: state.tasks
                                    .map(
                                      (e) => _todoTile(
                                        e,
                                        onEdit: () {},
                                        hasFile: e.hasFileAttachment(),
                                      ),
                                    )
                                    .toList(),
                              );
                      },
                    ),
                  ),
                ),

                // Section: Détail de l’action
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: _sectionCard(
                    title: 'Detail de l’action',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 15,
                          children: [
                            _labelValue('Type action', const SizedBox()),
                            CustomChipWidget(
                              text: widget.action.humanReadableType,
                              color: AppColors.chipGreen,
                            ),
                          ],
                        ),
                        _line(),
                        _labelValue(
                          'Processus concerné',
                          Text(
                            widget.action.process?.title ?? 'Non spécifié',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        _line(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _labelValue(
                                  'Justifications de l’action',
                                  const SizedBox(),
                                ),
                                const CustomChipWidget(
                                  text: 'Écart',
                                  color: AppColors.chipRed,
                                ),
                              ],
                            ),

                            Text(
                              widget.action.justification ?? 'Sans titre',
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),

                        _line(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _labelValue('Origine', const SizedBox()),
                                Text(
                                  widget.action.humanReadableOrigin,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.action.origin ?? 'Non spécifié',
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Section: Rapports
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: _sectionCard(
                    title: 'Rapports',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _labelValue('Date :', const SizedBox()),
                            Text(
                              '12 Août 2025',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _labelValue(
                            'Conclusion',
                            Text(
                              'Finalisation de la procédure de validation qualité des offres commerciales Finalisation de la procédure de validation qualité des offres commercialesFinalisation de la procédure de validation qualité des offres commercialesFinalisation de la procédure de validation qualité des offres commerciales',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Divider(color: AppColors.divider, height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Piece jointe',
                            style: GoogleFonts.poppins(color: AppColors.sub),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Assets.svgs.pdf.svg(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  'FicheDeNote.pdf',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              appColorsrimaryButton(
                                'Terminer',
                                onTap: _openReportSheet,
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
          );
        },
      ),
    );
  }

  Widget _titleBlock(ActionItem action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title lines (with the light highlight)
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE7F0FF),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              action.justification ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Row(
            children: [
              _meta(
                'Date',
                '${DateTime.parse(action.startDate!).day.toString().padLeft(2, '0')}-${DateTime.parse(action.startDate!).month.toString().padLeft(2, '0')}-${DateTime.parse(action.startDate!).year}',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: _meta('Ref :', '${action.reference}'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: _meta('Ver :', '${action.version}'),
              ),
              const Spacer(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            appColorsrimaryButton('Terminer', onTap: _openReportSheet),
          ],
        ),
      ],
    );
  }
}

/* --------------------- helpers & sub-widgets --------------------- */

Widget _meta(String k, String v) => RichText(
  text: TextSpan(
    style: GoogleFonts.poppins(color: AppColors.sub, fontSize: 13),
    children: [
      TextSpan(text: '$k '),
      TextSpan(
        text: v,
        style: const TextStyle(
          color: AppColors.dark,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  ),
);

Widget _roundedField({required Widget child}) => Container(
  decoration: BoxDecoration(
    color: AppColors.field,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0xFFE5EAF0)),
  ),
  child: child,
);

Widget _roundIcon(
  IconData ic, {
  Color bg = const Color(0xFFEFF2FF),
  Color icColor = AppColors.dark,
  VoidCallback? onTap,
}) => Material(
  color: bg,
  shape: const CircleBorder(),
  child: InkWell(
    customBorder: const CircleBorder(),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(ic, color: icColor, size: 20),
    ),
  ),
);

Widget _tinyCounter(int n) => Container(
  decoration: BoxDecoration(
    color: AppColors.badge,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Text(
      '$n',
      style: GoogleFonts.poppins(
        color: AppColors.blue,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
    ),
  ),
);

Widget _sectionCard({
  required String title,
  Widget? trailing,
  VoidCallback? onAdd,
  required Widget child,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
      ],
      border: Border.all(color: AppColors.divider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF3F5FF),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Row(
              children: [
                Assets.svgs.jamBlue.svg(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
          child: child,
        ),
      ],
    ),
  );
}

Widget appColorsillButton(
  String label, {
  IconData? icon,
  required VoidCallback onTap,
}) => Material(
  color: Colors.transparent,
  shape: const StadiumBorder(side: BorderSide()),
  child: InkWell(
    onTap: onTap,
    customBorder: const StadiumBorder(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 16),
          if (icon != null) const Padding(padding: EdgeInsets.only(left: 6)),
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        ],
      ),
    ),
  ),
);

Widget appColorsrimaryButton(String label, {required VoidCallback onTap}) =>
    Material(
      color: AppColors.blue,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );

Widget _labelValue(String label, Widget value) => Padding(
  padding: const EdgeInsets.only(bottom: 12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: GoogleFonts.poppins(color: AppColors.sub)),
      value,
    ],
  ),
);

Widget _line() => const Padding(
  padding: EdgeInsets.only(top: 12, bottom: 12),
  child: Divider(color: AppColors.divider, height: 1),
);

Widget _todoTile(
  ActionTask t, {
  VoidCallback? onToggle,
  VoidCallback? onEdit,
  bool hasFile = false,
}) {
  final Color dueColor = t.isInProgress
      ? AppColors.chipGreen
      : t.isLate
      ? AppColors.chipRed
      : AppColors.sub;

  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: InkWell(
              onTap: onToggle,
              child: Icon(
                t.crossed
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: t.crossed ? AppColors.blue : AppColors.sub,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.title ?? '',
                    style: GoogleFonts.poppins(
                      decoration: t.crossed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: AppColors.dark,
                      decorationThickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        Text(
                          t.dueLabel,
                          style: GoogleFonts.poppins(
                            color: dueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        if (hasFile)
                          const Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Icon(
                              Icons.attach_file_rounded,
                              size: 16,
                              color: Colors.black,
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
      const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Divider(color: AppColors.divider, height: 1),
      ),
    ],
  );
}

/// ====== BOTTOM SHEETS (Rapport / Ajouter) ======

Future<void> _openBottomSheet(
  BuildContext context, {
  required String title,
  required String firstLabel,
  required VoidCallback onSubmit,
}) {
  final textCtrl = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (ctx) {
      final bottom = MediaQuery.of(ctx).viewInsets.bottom;
      String pieceJointe = 'Selectionez media';
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header with close
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: const Color(0xFF0E3C42),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          padding: const EdgeInsets.all(4),

                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close_rounded, size: 20),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      firstLabel,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _roundedField(
                      child: TextField(
                        controller: textCtrl,
                        minLines: 5,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: 'Ecrire',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      'Media',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {
                        FilePicker.platform
                            .pickFiles(
                              allowedExtensions: [
                                'jpg',
                                'jpeg',
                                'png',
                                'pdf',
                                'doc',
                                'docx',
                              ],
                              type: FileType.custom,
                            )
                            .then((result) {
                              if (result != null && result.files.isNotEmpty) {
                                setState(() {
                                  pieceJointe = result.files.first.name;
                                });
                              }
                            });
                      },
                      child: _roundedField(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.attach_file_rounded,
                                color: AppColors.dark,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                pieceJointe,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: AppColors.sub,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: appColorsrimaryButton('Terminer', onTap: onSubmit),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
