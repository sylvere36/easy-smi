import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/show_network_image_viewer.dart';

// ===================== BODY =====================

class BadEventDetailBody extends StatefulWidget {
  const BadEventDetailBody({super.key});

  @override
  State<BadEventDetailBody> createState() => _BadEventDetailBodyState();
}

class _BadEventDetailBodyState extends State<BadEventDetailBody> {
  final _commentCtrl = TextEditingController();

  // --- états d'ouverture des sections
  final _open = <String, bool>{
    'description': true,
    'causes': true,
    'imm': true,
    'long': true,
    'eval': true,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
      children: [
        _HeaderCard(onValidate: () {}),

        // ----------- zone commentaire -----------
        _CommentComposer(
          controller: _commentCtrl,
          onSend: () {
            if (_commentCtrl.text.trim().isEmpty) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Commentaire ajouté (démo)')),
            );
            _commentCtrl.clear();
          },
        ),
        const SizedBox(height: 8),
        _CommentsList(),
        const SizedBox(height: 8),

        // ----------- vignettes & puces -----------
        _EvidenceStrip(
          onTapImage: (url) => showNetworkImageViewer(context, images: [url]),
        ),
        const SizedBox(height: 8),
        const _ChipsRow(
          type: 'Accident',
          gravite: 'Mineur',
          site: 'Espace vert',
        ),
        const SizedBox(height: 8),

        // ----------- Description -----------
        _Section(
          title: 'Description de l\'evennement',
          icon: Icons.description_outlined,
          open: _open['description']!,
          onToggle: () =>
              setState(() => _open['description'] = !_open['description']!),
          child: const _InfoBlock(
            label: 'Détails',
            text:
                'Marketing international et développement des ventes régionales. '
                'Incident survenu lors d\'une opération de chargement au quai 1. '
                'Aucune blessure, dégâts matériels mineurs.',
          ),
        ),
        const SizedBox(height: 8),

        // ----------- Analyses des causes -----------
        _Section(
          title: 'Analyses des causes',
          icon: Icons.analytics_outlined,
          open: _open['causes']!,
          onToggle: () => setState(() => _open['causes'] = !_open['causes']!),
          child: Column(
            children: List.generate(4, (i) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: _CauseCard(
                  title: 'Pourquoi le statut ne change pas ?',
                  reason:
                      'Délai d’approvisionnement et consigne de sécurité non diffusée à toute l’équipe.',
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 8),

        // ----------- Mesures immédiates -----------
        _Section(
          title: 'Les mesures correctives : action immédiates',
          icon: Icons.handyman_outlined,
          open: _open['imm']!,
          onToggle: () => setState(() => _open['imm'] = !_open['imm']!),
          child: const Column(
            children: [
              _ActionCard(
                badge: 'Préventive',
                title:
                    'Renforcement du contrôle qualité dans le département Gestion Produits',
                processus: 'Marketing international et développement',
                justification:
                    'Rapport de constat fait par l’équipe lors de l’audit; constat lié par l’équipe lors de l’audit constat fait.',
                typeOrigine: 'Audit',
                typeEcart: 'Non conformité ISO 9001',
                responsable: 'Jenan YVES SOUROU',
                pieceJointe: true,
              ),
              SizedBox(height: 8),
              _ActionCard(
                badge: 'Préventive',
                title:
                    'Renforcement du contrôle qualité dans le département Gestion Produits',
                processus: 'Marketing international et développement',
                justification:
                    'Rapport de constat fait par l’équipe lors de l’audit constat lié par l’équipe lors de l’audit constat fait.',
                typeOrigine: 'Audit',
                typeEcart: 'Non conformité ISO 9001',
                responsable: 'Jenan YVES SOUROU',
                pieceJointe: true,
                ecart: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // ----------- Long terme -----------
        _Section(
          title: 'Les mesures correctives : action à long terme',
          icon: Icons.task_alt_outlined,
          open: _open['long']!,
          onToggle: () => setState(() => _open['long'] = !_open['long']!),
          child: Column(
            children: [
              _ActionCard(
                badge: 'Préventive',
                title:
                    'Renforcement du contrôle qualité dans le département Gestion Produits',
                processus: 'Marketing international et développement',
                justification:
                    'Rapport de constat fait par l’équipe lors de l’audit constat lié par l’équipe lors de l’audit constat fait.',
                justificationtype: Container(
                  color: Colors.white,
                  child: Text(
                    'Opportunité',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: Colors.green,
                    ),
                  ),
                ),
                typeOrigine: 'Audit',
                typeEcart: 'Non conformité ISO 9001',
                responsable: 'Jenan YVES SOUROU',
                pieceJointe: true,
                longTerme: true,
              ),
              const SizedBox(height: 8),
              _ActionCard(
                badge: 'Préventive',
                title:
                    'Renforcement du contrôle qualité dans le département Gestion Produits',
                processus: 'Marketing international et développement',
                justification:
                    'Rapport de constat fait par l’équipe lors de l’audit constat lié par l’équipe lors de l’audit constat fait.',
                justificationtype: Text(
                  'Ecart',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    color: Colors.red,
                  ),
                ),
                typeOrigine: 'Audit',
                typeEcart: 'Non conformité ISO 9001',
                responsable: 'Jenan YVES SOUROU',
                pieceJointe: true,
                longTerme: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // ----------- Evaluation de l'efficacité -----------
        _Section(
          title: 'Evaluation de l’efficacité',
          icon: Icons.verified_outlined,
          open: _open['eval']!,
          onToggle: () => setState(() => _open['eval'] = !_open['eval']!),
          child: Column(
            children: [
              _EvalCard(
                type: 'Audit',
                label: 'Revue documentaire',
                note:
                    'Marketing international et développement des ventes régionales (checking international).',
                statutChip: _StatChip.done('Fait'),
                responsable: 'Henry DESFOUR',
                date: '23 mars 2024',
              ),
              const SizedBox(height: 8),
              _EvalCard(
                type: 'Audit',
                label: 'Revue documentaire',
                note:
                    'Marketing international et développement des ventes régionales (checking international).',
                statutChip: _StatChip.planned('Programmé'),
                responsable: 'Henry DIGUIN',
                date: '29 mars 2024',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ===================== HEADER =====================

class _HeaderCard extends StatelessWidget {
  final VoidCallback onValidate;
  const _HeaderCard({required this.onValidate});

  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entrepot de stockage, zone de stockage', style: title),
            const SizedBox(height: 6),
            Wrap(
              children: [
                _pill('Date: ', '12-03-24'),

                _pill('REF: ', 'ABR-ANA-UAA'),

                _pill('Ver: ', '01'),
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

// ===================== COMMENTS =====================

class _CommentComposer extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const _CommentComposer({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const CommentsRoute());
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 8, 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Écrire un commentaire',
                    hintStyle: GoogleFonts.inter(color: Colors.grey.shade500),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: onSend,
                icon: const Icon(Icons.attachment_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          children: List.generate(2, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1BB38A),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'MH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Beatrice BOSSOU',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                'Il y a 30 min',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6, right: 2),
                            child: Text(
                              'Les documents fournis ne respectent pas les normes internationales',
                              style: TextStyle(fontSize: 16, height: 1.35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ===================== EVIDENCES + CHIPS =====================

class _EvidenceStrip extends StatelessWidget {
  final void Function(String) onTapImage;
  const _EvidenceStrip({required this.onTapImage});

  @override
  Widget build(BuildContext context) {
    final url =
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=800&auto=format&fit=crop';
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
                  Assets.svgs.jamPurple.svg(),
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
            trailing: justificationtype,
          ),
          _InfoLine(
            label: 'Type d’origine',
            value: typeEcart,
            trailing: Container(
              color: Colors.black26,
              child: Text(
                'Audits',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const _InfoLine(
            label: 'Opérationnalisation',
            value: 'Pièce jointe',
            pieceJointe: true,
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
          Row(
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
      color: c.withOpacity(.12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: c.withOpacity(.2)),
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
