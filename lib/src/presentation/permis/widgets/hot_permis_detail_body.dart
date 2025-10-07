import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../injection_container.dart';
import '../../../application/communication/comments_bloc.dart';
import '../../../application/permit/detail/permit_detail_bloc.dart';
import '../../../domain/permit/models/permit_item.dart';
import '../../../domain/permit/models/permit_personnel_assignment.dart';
import '../../_commons/helpers/date_helpers.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/comments/comment_field.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../comments/widgets/resume_comment_widget.dart';

class HotPermitDetailBody extends StatefulWidget {
  final PermitItem permit;
  const HotPermitDetailBody({super.key, required this.permit});

  @override
  State<HotPermitDetailBody> createState() => _HotPermitDetailBodyState();
}

class _HotPermitDetailBodyState extends State<HotPermitDetailBody> {
  // --- Données locales mock ---
  final List<_Personnel> _team = [
    _Personnel(
      name: 'AMOUSSOU Jacques',
      affect: AffectType.dedie,
      qualified: false,
    ),
    _Personnel(
      name: 'AMOUSSOU Jacques',
      affect: AffectType.reserve,
      qualified: true,
    ),
  ];

  // --- Styles rapides ---
  TextStyle get title =>
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get subtitle =>
      GoogleFonts.poppins(fontSize: 13.5, color: const Color(0xFF7A7A7A));
  TextStyle get label =>
      GoogleFonts.poppins(fontSize: 12.5, color: const Color(0xFF8E8E93));
  TextStyle get strong =>
      GoogleFonts.poppins(fontSize: 13.5, fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CommentsBloc>(context).add(
      CommentsEvent.fetchRequested(
        commentableType: 'Conformity',
        commentableId: widget.permit.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PermitDetailBloc>()
        ..add(PermitDetailEvent.fetchRequested(id: widget.permit.id))
        ..add(
          PermitDetailEvent.personnelNextPageRequested(id: widget.permit.id),
        )
        ..add(
          PermitDetailEvent.typeControlsNextPageRequested(id: widget.permit.id),
        )
        ..add(
          PermitDetailEvent.fireControlsNextPageRequested(id: widget.permit.id),
        )
        ..add(
          PermitDetailEvent.riskAssessmentsNextPageRequested(
            id: widget.permit.id,
          ),
        ),
      child: BlocBuilder<PermitDetailBloc, PermitDetailState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                sliver: SliverList.list(
                  children: [
                    // ---------------- Header ----------------
                    Text(
                      widget.permit.title,
                      style: GoogleFonts.poppins(
                        fontSize: 18.5,
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        _tinyMeta(
                          'Date:',
                          formatSimplified(
                            DateTime.tryParse(widget.permit.startDate ?? ''),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _tinyMeta('Ref :', '${widget.permit.reference}'),
                        const SizedBox(width: 12),
                        _tinyMeta('Ver :', '${widget.permit.version}'),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              foregroundColor: const WidgetStatePropertyAll(
                                Color(0xFF2563EB),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Soumettre à validation',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Comment composer
                    // ----------- zone commentaire -----------
                    BlocBuilder<CommentsBloc, CommentsState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: CommentFieldWidget(
                            isLoading: state.isSubmitting,
                            onSend: (String text, File? file) {
                              BlocProvider.of<CommentsBloc>(context).add(
                                CommentsEvent.addCommentRequested(
                                  commentableType: 'Action',
                                  commentableId: widget.permit.id,
                                  attachmentPath: file?.path,
                                  body: text,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    // Comments header + tiny list
                    ResumeCommentWidget(
                      commentableType: 'Action',
                      commentableId: widget.permit.id,
                      commentsCount: BlocProvider.of<CommentsBloc>(
                        context,
                      ).state.items.length,
                    ),

                    const SizedBox(height: 10),

                    // ---------------- Infos clés ----------------
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _kv(
                            'Type de travail',
                            widget.permit.workTypeReadable,
                            isRow: false,
                          ),
                          const Divider(height: 18),
                          _kv(
                            'Zone / Emplacement',
                            widget.permit.location ?? 'Non spécifié',
                            isRow: false,
                          ),
                          const Divider(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: _kv(
                                  'Date debut',
                                  DateTime.tryParse(
                                            widget.permit.startDate ?? '',
                                          ) !=
                                          null
                                      ? formatDate(widget.permit.startDate!)
                                      : 'Non spécifié',
                                  isRow: false,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _kv(
                                  'Date fin',
                                  DateTime.tryParse(
                                            widget.permit.endDate ?? '',
                                          ) !=
                                          null
                                      ? formatDate(widget.permit.endDate!)
                                      : 'Non spécifié',
                                  isRow: false,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 18),
                          _kv(
                            'Durée Moyen Par Jours',
                            '${widget.permit.averageDuration ?? '--'} heures',
                            isRow: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---------------- Description / Objectif ----------------
                    _sectionTitle(
                      'Description / Objectif',
                      icon: Icons.info_outline_rounded,
                    ),
                    _card(
                      child: Text(
                        widget.permit.description ?? 'Aucune description',
                        style: subtitle.copyWith(
                          color: const Color(0xFF444444),
                          height: 1.35,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---------------- Personnel affecté ----------------
                    _sectionTitle(
                      'Personnel affecté',
                      icon: Icons.group_outlined,
                      action: FilledButton.icon(
                        onPressed: _openAddPersonnel,
                        icon: const Icon(Icons.add, size: 18),
                        label: Text(
                          'Ajouter',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                        ),
                      ),
                    ),

                    _card(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                      child: Column(
                        children: [
                          _kv('Personnes', ''),
                          Column(
                            children: [
                              if (state.isLoadingPersonnel)
                                const LoadingWidget()
                              else if (state.personnel.isEmpty &&
                                  !state.isLoadingPersonnel)
                                EmptyWidget.noData()
                              else
                                ...state.personnel.map((p) => _personRow(p)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---------------- Contrôleur incendie ----------------
                    _sectionTitle(
                      'Contrôleur incendie',
                      icon: Icons.local_fire_department_outlined,
                      action: FilledButton(
                        onPressed: () {
                          context.router.push(const InspectionSectionRoute());
                        },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Controler',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (state.isLoadingFireControls)
                      const LoadingWidget()
                    else if (state.fireControls.isEmpty &&
                        !state.isLoadingFireControls)
                      EmptyWidget.noData()
                    else
                      _card(
                        child: Column(
                          children: [
                            for (
                              var i = 0;
                              i < state.fireControls.length;
                              i++
                            ) ...[
                              _controlLine(
                                state.fireControls[i].controllerName,
                                formatDateTimeWithMark(
                                  DateTime.tryParse(
                                    state.fireControls[i].verificationDate ??
                                        '',
                                  ),
                                ),
                                state.fireControls[i].conclusionLabel,
                                (state.fireControls[i].gasLevelResult ?? 0) /
                                    100,
                              ),
                              if (i < state.fireControls.length - 1)
                                const Divider(height: 18),
                            ],
                          ],
                        ),
                      ),

                    const SizedBox(height: 20),

                    // ---------------- Evaluation du risque ----------------
                    _sectionTitle(
                      'Évaluation du risques',
                      icon: Icons.assignment_turned_in_outlined,
                      action: FilledButton(
                        onPressed: () {
                          context.router.push(
                            RiskAssessmentRoute(permit: widget.permit),
                          );
                        },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          'Démarrer',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (state.isLoadingRiskAssessments)
                      const LoadingWidget()
                    else if (state.riskAssessments.isEmpty &&
                        !state.isLoadingRiskAssessments)
                      EmptyWidget.noData()
                    else
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...state.riskAssessments.map(
                              (e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _kv(
                                        'Evaluateur',
                                        e.evaluatorName,
                                        isRow: false,
                                      ),
                                      _statusChip(
                                        e.statusLabel,
                                        color: e.isConforme
                                            ? AppColors.green
                                            : e.isNonConforme
                                            ? AppColors.chipRed
                                            : AppColors.primary,
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 18),

                                  _kv(
                                    'Conclusion',
                                    e.conclusion ?? 'Aucune conclusion',
                                    isRow: false,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),

                            _reportButton(),
                          ],
                        ),
                      ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Widgets utilitaires
  // ---------------------------------------------------------------------------

  Widget _kv(String k, String v, {bool isRow = true}) {
    return isRow
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(k, style: label)),
              Expanded(child: Text(v, style: strong)),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(k, style: label),
              Text(v, style: strong),
            ],
          );
  }

  Widget _card({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(12),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(String t, {required IconData icon, Widget? action}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE6E6E6)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Assets.svgs.jamPurple.svg(),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(t, style: title)),
        if (action != null) action,
      ],
    );
  }

  Widget _personRow(PermitPersonnelAssignment p) {
    final color = p.qualified ? AppColors.green : AppColors.chipRed;
    final labelTxt = p.trainingLabel;
    final sub = p.assignmentTypeLabel;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 7,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(flex: 3, child: Text(p.fullName, style: strong)),
                    Expanded(flex: 2, child: Text(sub, style: subtitle)),
                  ],
                ),
                _statusChip(labelTxt, color: color),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {},
                child: Row(
                  spacing: 10,
                  children: [
                    const Icon(Icons.edit_outlined, color: Colors.black),
                    Text('Modifier', style: GoogleFonts.dmSans(fontSize: 15)),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {},
                child: Row(
                  spacing: 10,
                  children: [
                    const Icon(Icons.backspace_outlined, color: Colors.black),
                    Text('Retirer', style: GoogleFonts.dmSans(fontSize: 15)),
                  ],
                ),
              ),
            ],
            icon: Assets.svgs.property.svg(),
          ),
        ],
      ),
    );
  }

  Widget _controlLine(String who, String when, String status, double gas) {
    final red = const Color(0xFFFF3B30);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _kv('Controleur de piquet', who, isRow: false),
              const SizedBox(height: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statut', style: label),
                  _statusChip(status, color: red),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            spacing: 3,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _kv('Dern Verification', when, isRow: false),
              _kv('Niveau de gaz', '${(gas * 100).round()} %', isRow: false),
            ],
          ),
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {},
              child: Row(
                spacing: 10,
                children: [
                  const Icon(Icons.edit_outlined, color: Colors.black),
                  Text('Modifier', style: GoogleFonts.dmSans(fontSize: 15)),
                ],
              ),
            ),
            PopupMenuItem(
              onTap: () {},
              child: Row(
                spacing: 10,
                children: [
                  const Icon(Icons.backspace_outlined, color: Colors.black),
                  Text('Retirer', style: GoogleFonts.dmSans(fontSize: 15)),
                ],
              ),
            ),
          ],
          icon: Assets.svgs.property.svg(),
        ),
      ],
    );
  }

  Widget _statusChip(String text, {required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: .5)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }

  Widget _reportButton() {
    return GestureDetector(
      onTap: () {
        context.router.push(const InspectionResultRoute());
      },
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('Rapport', style: strong.copyWith(color: Colors.green)),
      ),
    );
  }

  Widget _tinyMeta(String k, String v) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: const Color(0xFF8E8E93),
        ),
        children: [
          TextSpan(
            text: '$k ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: v,
            style: const TextStyle(color: Color(0xFF1C1C1E)),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Ajout de personnel (Modal Bottom Sheet)
  // ---------------------------------------------------------------------------
  void _openAddPersonnel() {
    showModalBottomSheet<_Personnel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final nameCtrl = TextEditingController();
        AffectType affect = AffectType.dedie;
        bool? qualified;
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 14,
            bottom: 20 + MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (ctx, setSheet) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'AJOUTER',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: nameCtrl,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      hintText: 'Nom et prenom(s)',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF9AA1A9),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF4F6FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Type d’affectation', style: strong),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _radioTile(
                          title: 'Personnel dediée',
                          value: AffectType.dedie,
                          groupValue: affect,
                          onChanged: (v) => setSheet(() => affect = v!),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _radioTile(
                          title: 'Personnel de reserve',
                          value: AffectType.reserve,
                          groupValue: affect,
                          onChanged: (v) => setSheet(() => affect = v!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Formation', style: strong),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _radioBool(
                          title: 'Non qualifié',
                          value: false,
                          groupValue: qualified,
                          onChanged: (v) => setSheet(() => qualified = v),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _radioBool(
                          title: 'Qualifié',
                          value: true,
                          groupValue: qualified,
                          onChanged: (v) => setSheet(() => qualified = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (nameCtrl.text.trim().isEmpty || qualified == null) {
                          return;
                        }
                        Navigator.pop(
                          ctx,
                          _Personnel(
                            name: nameCtrl.text.trim(),
                            affect: affect,
                            qualified: qualified!,
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        'Ajouter',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    ).then((p) {
      if (p != null) {
        setState(() => _team.add(p));
      }
    });
  }

  Widget _radioTile<T>({
    required String title,
    required T value,
    required T groupValue,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(title, style: GoogleFonts.poppins())),
        ],
      ),
    );
  }

  Widget _radioBool({
    required String title,
    required bool value,
    required bool? groupValue,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Radio<bool>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(title, style: GoogleFonts.poppins())),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Modèles simples
// -----------------------------------------------------------------------------

enum AffectType { dedie, reserve }

class _Personnel {
  final String name;
  final AffectType affect;
  final bool qualified;
  _Personnel({
    required this.name,
    required this.affect,
    required this.qualified,
  });
}
