import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

class HotPermitDetailBody extends StatefulWidget {
  const HotPermitDetailBody({super.key});

  @override
  State<HotPermitDetailBody> createState() => _HotPermitDetailBodyState();
}

class _HotPermitDetailBodyState extends State<HotPermitDetailBody> {
  final _commentCtrl = TextEditingController();

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
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          sliver: SliverList.list(
            children: [
              // ---------------- Header ----------------
              Text(
                'Soudure de renford métallique sur coque au niveau de la zone côtière',
                style: GoogleFonts.poppins(
                  fontSize: 18.5,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                children: [
                  _tinyMeta('Date:', '12-03-25'),
                  const SizedBox(width: 12),
                  _tinyMeta('Ref :', 'AZE-ABA-AUA'),
                  const SizedBox(width: 12),
                  _tinyMeta('Ver :', '01'),
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
              const SizedBox(height: 12),

              // Comment composer
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

              const SizedBox(height: 10),

              // ---------------- Infos clés ----------------
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _kv('Type de travail', 'Travail dangereux', isRow: false),
                    const Divider(height: 18),
                    _kv(
                      'Zone / Emplacement',
                      'Fidjrosse , emplacement de dechargement',
                      isRow: false,
                    ),
                    const Divider(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: _kv(
                            'Date debut',
                            'Lun 04 Mars,2025',
                            isRow: false,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _kv(
                            'Date fin',
                            'Lun 04 Mars,2025',
                            isRow: false,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 18),
                    _kv('Durée Moyen Par Jours', '05 Heures', isRow: false),
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
                  'Marketing international et developpement des ventes regionales arketing internationnal. '
                  'Marketing international et developpement des ventes regionales arketing internationnal',
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
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
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
                    Column(children: [for (final p in _team) _personRow(p)]),
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
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              _card(
                child: Column(
                  children: [
                    _controlLine(
                      'AMOUSSOU Jacques',
                      '13 Mars 2025 · 10:34',
                      'Non Conforme',
                      0.80,
                    ),
                    const Divider(height: 18),
                    _controlLine(
                      'AMOUSSOU Jacques',
                      '13 Mars 2025 · 10:34',
                      'Non Conforme',
                      0.80,
                    ),
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
                    context.router.push(const InspectionSectionRoute());
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
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _kv('Evaluateur', 'AMOUSSOU Jacques', isRow: false),
                        _statusChip(
                          'Non Conforme',
                          color: const Color(0xFFFF3B30),
                        ),
                      ],
                    ),
                    const Divider(height: 18),

                    _kv(
                      'Conclusion',
                      'Marketing internationnal et developpoppement des ventes regionales arketing internationnall. '
                          'Marketing internationnall et developpoppement des ventes regionales arketing internationnall',
                      isRow: false,
                    ),
                    const Divider(height: 18),
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

  Widget _personRow(_Personnel p) {
    final color = p.qualified
        ? const Color(0xFF17B074)
        : const Color(0xFFFF3B30);
    final labelTxt = p.qualified ? 'Qualifié' : 'Non qualifié';
    final sub = p.affect == AffectType.dedie
        ? 'Personnel dédié'
        : 'Pers de reserve';
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
                    Expanded(flex: 3, child: Text(p.name, style: strong)),
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
