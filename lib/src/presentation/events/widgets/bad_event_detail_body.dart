import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../injection_container.dart';
import '../../../application/actions/actions_bloc.dart';
import '../../../application/communication/comments_bloc.dart';
import '../../../application/evalutaion/evaluation_bloc.dart';
import '../../../application/events/detail/event_detail_bloc.dart';
import '../../../domain/action/i_action_repository.dart';
import '../../../domain/evaluation/models/evaluation.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons/utils/app_constants.dart';
import '../../_commons_widgets/comments/comment_field.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/show_network_image_viewer.dart';
import '../../comments/widgets/resume_comment_widget.dart';

// ===================== BODY =====================

class BadEventDetailBody extends StatefulWidget {
  const BadEventDetailBody({super.key});

  @override
  State<BadEventDetailBody> createState() => _BadEventDetailBodyState();
}

class _BadEventDetailBodyState extends State<BadEventDetailBody> {
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    isInit = true;
  }

  // --- états d'ouverture des sections
  final _open = <String, bool>{
    'description': true,
    'causes': true,
    'imm': true,
    'long': true,
    'eval': true,
  };

  String commentTableType = 'Event';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventDetailsBloc, EventDetailState>(
      listener: (contextEventDetail, detailState) {
        if (isInit && detailState.item != null) {
          context.read<EvaluationsBloc>().add(
            EvaluationsEvent.fetch(event: detailState.item!.id),
          );
          context.read<ActionsBloc>().add(
            ActionsEvent.fetchByOrigin(
              originType: 'END',
              originId: detailState.item!.id,
            ),
          );

          context.read<CommentsBloc>().add(
            CommentsEvent.fetchRequested(
              commentableType: commentTableType,
              commentableId: detailState.item!.id,
            ),
          );

          isInit = false;
        }
      },
      builder: (contextEventDetail, detailState) {
        if (detailState.item == null) {
          return const Center(child: LoadingWidget());
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
          children: [
            _HeaderCard(
              title: detailState.item?.title ?? '',
              ref: detailState.item?.reference ?? '',
              date: detailState.item?.date != null
                  ? DateFormat('dd-MM-yy').format(detailState.item!.date!)
                  : '',
              version: detailState.item?.version ?? '',
              onValidate: () {
                final id = detailState.item?.id;
                if (id != null) {
                  contextEventDetail
                      .read<EventDetailsBloc>()
                      .add(EventDetailsEvent.requestValidation(id: id));
                }
              },
            ),

            // ----------- zone commentaire -----------
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
                          commentableType: commentTableType,
                          commentableId: detailState.item!.id,
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
              commentableType: commentTableType,
              commentableId: detailState.item!.id,
              commentsCount: BlocProvider.of<CommentsBloc>(
                context,
                listen: true,
              ).state.items.length,
            ),

            // ----------- vignettes & puces -----------
            if (detailState.item!.attachments.isNotEmpty)
              ...detailState.item!.attachments.map(
                (image) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _EvidenceStrip(
                    image: image,
                    onTapImage: (url) =>
                        showNetworkImageViewer(context, images: [url]),
                  ),
                ),
              ),
            if (detailState.item!.attachments.isEmpty)
              _EvidenceStrip(
                image: null,
                onTapImage: (url) =>
                    showNetworkImageViewer(context, images: [url]),
              ),

            const SizedBox(height: 8),
            _ChipsRow(
              type: detailState.item!.humanType,
              gravite: detailState.item!.humanGravity,
              site: detailState.item!.site ?? '',
            ),
            const SizedBox(height: 8),

            // ----------- Description -----------
            _Section(
              title: 'Description de l\'evennement',
              icon: Icons.description_outlined,
              open: _open['description']!,
              onToggle: () =>
                  setState(() => _open['description'] = !_open['description']!),
              child: _InfoBlock(
                label: 'Détails',
                text: detailState.item!.description ?? '',
              ),
            ),
            const SizedBox(height: 8),

            // ----------- Analyses des causes -----------
            _Section(
              title: 'Analyses des causes',
              icon: Icons.analytics_outlined,
              open: _open['causes']!,
              onToggle: () =>
                  setState(() => _open['causes'] = !_open['causes']!),
              child: BlocBuilder<EventDetailsBloc, EventDetailState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: LoadingWidget());
                  }
                  if (state.causes != null && state.causes!.isEmpty) {
                    return const Center(child: Text('Pas d\'analyse de cause'));
                  }
                  if (state.causes == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: List.generate(state.causes!.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _CauseCard(
                          title: state.causes![i].question,
                          reason: state.causes![i].answer ?? '',
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),

            // ----------- Mesures immédiates -----------
            _Section(
              title: 'Les mesures correctives : action immédiates',
              icon: Icons.handyman_outlined,
              open: _open['imm']!,
              onToggle: () => setState(() => _open['imm'] = !_open['imm']!),
              child: BlocBuilder<ActionsBloc, ActionsState>(
                // bloc: action,
                builder: (context, state) {
                  if (state.isLoading || state.originItems == null) {
                    return const Center(child: LoadingWidget());
                  }
                  if (state.originItems != null && state.originItems!.isEmpty) {
                    return const Center(
                      child: Text('Pas d\'action immédiates'),
                    );
                  }

                  return Column(
                    children: [
                      ...state.originItems!.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _ActionCard(
                            badge: item.humanReadableType,
                            title: item.actionName,
                            processus: item.process?.title ?? '',
                            ecart: item.justificationType == 'gap',
                            opportunity:
                                item.justificationType == 'opportunity',
                            justification: item.justification ?? 'Non défini',
                            typeOrigine: item.humanReadableType,
                            typeEcart: item.origin != null
                                ? item.origin.toString()
                                : '',
                            responsable: item.inChargeName ?? '',
                            pieceJointe: item.document != null,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),

            // ----------- Long terme -----------
            BlocProvider(
              create: (context) =>
                  ActionsBloc(repository: sl<IActionRepository>())..add(
                    ActionsEvent.fetchByOrigin(
                      originType: 'ENI',
                      originId: detailState.item!.id,
                    ),
                  ),
              child: _Section(
                title: 'Les mesures correctives : action à long terme',
                icon: Icons.task_alt_outlined,
                open: _open['long']!,
                onToggle: () => setState(() => _open['long'] = !_open['long']!),
                child: BlocBuilder<ActionsBloc, ActionsState>(
                  builder: (context, state) {
                    if (state.isLoading || state.originItems == null) {
                      return const Center(child: LoadingWidget());
                    }
                    if (state.originItems != null &&
                        state.originItems!.isEmpty) {
                      return const Center(
                        child: Text('Pas d\'action à long terme'),
                      );
                    }
                    return Column(
                      children: [
                        ...state.originItems!.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _ActionCard(
                              badge: item.humanReadableType,
                              title: item.actionName,
                              processus: item.process?.title ?? '',
                              ecart: item.justificationType == 'gap',
                              opportunity:
                                  item.justificationType == 'opportunity',
                              justification: item.justification ?? 'Non défini',
                              typeOrigine: item.humanReadableType,
                              typeEcart: item.origin != null
                                  ? item.origin.toString()
                                  : '',
                              responsable: item.inChargeName ?? '',
                              pieceJointe: item.document != null,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),

            // ----------- Evaluation de l'efficacité -----------
            _Section(
              title: 'Evaluation de l’efficacité',
              icon: Icons.verified_outlined,
              open: _open['eval']!,
              onToggle: () => setState(() => _open['eval'] = !_open['eval']!),
              child: BlocBuilder<EvaluationsBloc, EvaluationsState>(
                builder: (context, evaluationState) {
                  if (evaluationState.items == null) {
                    return const Center(child: LoadingWidget());
                  }
                  if (evaluationState.items != null &&
                      evaluationState.items!.isEmpty) {
                    return const Center(
                      child: Text('Aucune évaluation trouvée'),
                    );
                  }
                  if (evaluationState.items == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      ...evaluationState.items!.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _EvalCard(
                            type: item.humanType,
                            label: item.title,
                            note: item.report,
                            statutChip: item.status == EvaluationStatus.done
                                ? _StatChip.done(item.humanStatus)
                                : _StatChip.planned(item.humanStatus),
                            responsable: '',
                            date: item.toFenchDate,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

// ===================== HEADER =====================

class _HeaderCard extends StatelessWidget {
  final String title;
  final String ref;
  final String version;
  final String date;
  final VoidCallback onValidate;
  const _HeaderCard({
    required this.title,
    required this.date,
    required this.ref,
    required this.version,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            const SizedBox(height: 6),
            Wrap(
              children: [
                _pill('Date: ', date),

                _pill('REF: ', ref),

                _pill('Ver: ', version),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: onValidate,
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          side: const BorderSide(color: AppColors.primary),
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
          ],
        ),
      ),
    );
  }

  Widget _pill(String text, String text2) => Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF475569),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text2,
          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// ===================== EVIDENCES + CHIPS =====================

class _EvidenceStrip extends StatelessWidget {
  final String? image;
  final void Function(String) onTapImage;
  const _EvidenceStrip({required this.image, required this.onTapImage});

  @override
  Widget build(BuildContext context) {
    final url = image == null
        ? AppConstants.tempImageNetwork
        : AppConstants.getImageNetworkUrl(image!);
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          onTapImage(url);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(url, width: 190, height: 120, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _ChipsRow extends StatelessWidget {
  final String type, gravite, site;
  const _ChipsRow({
    required this.type,
    required this.gravite,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip('Type', type),
        const SizedBox(width: 8),
        _chip('Gravité', gravite),
        const SizedBox(width: 8),
        _chip('Site', site),
      ],
    );
  }

  Widget _chip(String label, String value) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              color: const Color(0xFF64748B),
              letterSpacing: .4,
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
        ],
      ),
    ),
  );
}

// ===================== SECTIONS =====================

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool open;
  final VoidCallback onToggle;
  final Widget child;
  const _Section({
    required this.title,
    required this.icon,
    required this.open,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Row(
                children: [
                  Assets.svgs.jamOrange.svg(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Icon(open ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
          ),
          if (open) const Divider(height: 1),
          if (open)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: child,
            ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label, text;
  const _InfoBlock({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    final cap = GoogleFonts.inter(
      fontSize: 10,
      color: const Color(0xFF64748B),
      letterSpacing: .4,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: cap),
          const SizedBox(height: 4),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}

class _CauseCard extends StatelessWidget {
  final String title;
  final String reason;
  const _CauseCard({required this.title, required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoLine(label: 'Pourquoi', value: title),
          const Divider(height: 8),
          _InfoLine(label: 'Raisons', value: reason),
        ],
      ),
    );
  }
}

// ===================== ACTIONS =====================

class _ActionCard extends StatelessWidget {
  final String badge;
  final String title;
  final String processus;
  final String justification;
  final Widget justificationtype;
  final String typeOrigine;
  final String typeEcart;
  final String responsable;
  final bool pieceJointe;
  final bool ecart;
  final bool opportunity;
  final bool longTerme;
  const _ActionCard({
    required this.badge,
    required this.title,
    required this.processus,
    required this.justification,
    required this.typeOrigine,
    required this.typeEcart,
    required this.responsable,
    this.justificationtype = const SizedBox(),
    this.pieceJointe = false,
    this.ecart = false,
    this.opportunity = false,
    this.longTerme = false,
  });

  @override
  Widget build(BuildContext context) {
    final badgeColor = const Color(0xFF16A34A); // vert
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Color(0x08000000),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _badge(badge, badgeColor),
              const Spacer(),
              // if (longTerme) _badge('LT', const Color(0xFF0EA5E9)),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          _InfoLine(label: 'Processus', value: processus),
          _InfoLine(
            label: 'Justifications',
            value: justification,
            trailing: ecart
                ? Text(
                    'Ecart',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: Colors.red,
                    ),
                  )
                : opportunity
                ? Text(
                    'Opportunité',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: Colors.green,
                    ),
                  )
                : justificationtype,
          ),
          if (typeEcart.isNotEmpty)
            _InfoLine(
              label: 'Type d’origine',
              value: typeEcart,
              // trailing: Container(
              //   color: Colors.black26,
              //   child: Text(
              //     'Audits',// typeOrigine
              //     style: GoogleFonts.dmSans(
              //       fontWeight: FontWeight.w700,
              //       fontSize: 14,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ),

          if (pieceJointe)
            _InfoLine(
              label: 'Opérationnalisation',
              value: 'Pièce jointe',
              pieceJointe: pieceJointe,
            ),

          _InfoLine(label: 'Responsable', value: responsable, inline: true),
        ],
      ),
    );
  }

  Widget _badge(String text, Color color) => Container(
    margin: const EdgeInsets.only(top: 2),
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        text,
        style: GoogleFonts.dmSans(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

class _InfoLine extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;
  final bool pieceJointe;
  final bool danger;
  final bool inline;
  const _InfoLine({
    required this.label,
    required this.value,
    this.trailing,
    this.pieceJointe = false,
    this.danger = false,
    this.inline = false,
  });

  @override
  Widget build(BuildContext context) {
    final cap = GoogleFonts.inter(
      fontSize: 10,
      color: const Color(0xFF64748B),
      letterSpacing: .4,
    );
    final val = GoogleFonts.inter(
      fontSize: 13,
      color: danger ? const Color(0xFFDC2626) : const Color(0xFF111827),
    );
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: cap),
            trailing ?? const SizedBox(),
          ],
        ),
        const SizedBox(height: 3),
        if (pieceJointe)
          Row(
            spacing: 5,
            children: [
              const Icon(Icons.picture_as_pdf_rounded, color: Colors.red),
              Text(value, style: val),
            ],
          ),

        if (!pieceJointe) Text(value, style: val),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: inline ? 0 : 8),
      child: inline ? content : content,
    );
  }
}

// ===================== EVALUATIONS =====================

class _EvalCard extends StatelessWidget {
  final String type, label, note, responsable, date;
  final Widget statutChip;
  const _EvalCard({
    required this.type,
    required this.label,
    required this.note,
    required this.statutChip,
    required this.responsable,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final cap = GoogleFonts.inter(
      fontSize: 10,
      color: const Color(0xFF64748B),
      letterSpacing: .4,
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                type,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              const Spacer(),
              statutChip,
            ],
          ),
          const SizedBox(height: 6),
          _InfoLine(label: 'Libellé', value: label),
          _InfoLine(label: 'Observations', value: note),
          responsable == ''
              ? _InfoLine(label: 'Échéance', value: date, inline: true)
              : Row(
                  children: [
                    Expanded(
                      child: _InfoLine(
                        label: 'Responsable',
                        value: responsable,
                        inline: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Échéance', style: cap),
                        const SizedBox(height: 3),
                        Text(date, style: GoogleFonts.inter(fontSize: 13)),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _StatChip {
  static Widget done(String text) => _chip(text, const Color(0xFF7C3AED));
  static Widget planned(String text) => _chip(text, const Color(0xFF059669));

  static Widget _chip(String text, Color c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: c.withValues(alpha: .12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: c.withValues(alpha: .2)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 8, color: c),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: c,
          ),
        ),
      ],
    ),
  );
}
