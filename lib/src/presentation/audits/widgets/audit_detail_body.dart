import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

class AuditDetailBody extends StatefulWidget {
  const AuditDetailBody({super.key});

  @override
  State<AuditDetailBody> createState() => _AuditDetailBodyState();
}

class _AuditDetailBodyState extends State<AuditDetailBody>
    with TickerProviderStateMixin {
  late final TabController _tab;
  final List<_Constat> _constats = [
    _Constat(
      titre: 'Description',
      texte:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
      medias: ['document de presentation', 'document de presentation'],
      commentaireAuteur: 'Maude Hall',
      commentaire:
          'Commentaire sur le LearderShirp et developpement sur le LearderShirp et developpement',
    ),
    _Constat(
      titre: 'Description',
      texte:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
      medias: ['document de presentation', 'document de presentation'],
      commentaireAuteur: 'Maude Hall',
      commentaire:
          'Commentaire sur le LearderShirp et developpement sur le LearderShirp et developpement',
    ),
  ];

  final List<_ResultItem> _results = [
    _ResultItem(
      point: 'Leadership et engagement',
      resume:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
      statut: _Statut.conforme,
      preuves: ['Preuve AB', 'Preuve de collecte'],
    ),
    _ResultItem(
      point: 'Leadership et engagement',
      resume:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
      statut: _Statut.nonConforme,
      preuves: ['Preuve AB', 'Preuve de collecte'],
    ),
    _ResultItem(
      point: 'Leadership et engagement',
      resume:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
      statut: _Statut.observation,
      preuves: ['Preuve AB', 'Preuve de collecte'],
    ),
  ];

  final List<_ActionItem> _actions = [
    _ActionItem(
      typeBadge: 'Corrective',
      color: const Color(0xFF00C853),
      titre:
          'Renforcement du control qualité dans le departement Gestion Produits',
      processus: 'Marketing international et developpement',
      justification:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat fait',
      origine: 'Non conformité ISO 9001',
      origineType: 'Audits',
      pieceJointe: 'Pièce jointe',
      responsable: 'Jenan YVES SOUSOSU',
      etat: 'Clôturé',
      etatColor: const Color(0xFFE53935),
    ),
    _ActionItem(
      typeBadge: 'Préventive',
      color: const Color(0xFF2E7D32),
      titre:
          'Renforcement du control qualité dans le departement Gestion Produits',
      processus: 'Marketing international et developpement',
      justification:
          'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat fait',
      origine: 'Non conformité ISO 9001',
      origineType: 'Audits',
      pieceJointe: 'Pièce jointe',
      responsable: 'Jenan YVES SOUSOSU',
      etat: 'En cours',
      etatColor: const Color(0xFF1565C0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 4, vsync: this);
  }

  TextStyle get _title => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.15,
  );

  TextStyle get _label => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  TextStyle get _value =>
      GoogleFonts.poppins(fontSize: 13.5, color: Colors.black87);

  bool addContact = false;

  @override
  Widget build(BuildContext context) {
    final onBlue = Colors.white;
    final blue = AppColors.primary;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: addContact
            ? FloatingActionButton(
                backgroundColor: blue,
                shape: const CircleBorder(),
                onPressed: _showAddConstatSheet,
                child: const Icon(Icons.add),
              )
            : null,
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (c, _) => [
              SliverToBoxAdapter(
                child: _Header(blue: blue, onBlue: onBlue),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabsDelegate(
                  TabBar(
                    controller: _tab,
                    onTap: (index) {
                      if (index == 1) {
                        addContact = true;
                      } else {
                        addContact = false;
                      }
                      setState(() {});
                    },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    indicatorColor: blue,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black54,
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    tabs: const [
                      Tab(text: 'Descriptions'),
                      Tab(text: 'Liste des constats'),
                      Tab(text: 'Resultats'),
                      Tab(text: 'Actions'),
                    ],
                  ),
                ),
              ),
            ],
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tab,
              children: [
                _DescriptionTab(title: _title, label: _label, value: _value),
                _ConstatsTab(constats: _constats),
                _ResultatsTab(items: _results),
                _ActionsTab(items: _actions),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddConstatSheet() async {
    final libelle = TextEditingController();
    final desc = TextEditingController();
    String? media;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) {
        final blue = const Color(0xFF1565D8);
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 18,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'NOUVEAU CONSTAT',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              _Input(
                title: 'Libelle constat',
                controller: libelle,
                hint: 'Libelle de l’audit',
              ),
              const SizedBox(height: 12),
              _Input(
                title: 'Description du constat',
                controller: desc,
                hint: 'Description de l’audit',
                minLines: 3,
                maxLines: 6,
              ),
              const SizedBox(height: 12),
              const Text(
                'Media',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  // ici on simule un média sélectionné
                  setState(() => media = 'document_de_presentation.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE6ECF2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.attach_file, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          media == null
                              ? 'Selectionez media'
                              : media!.split('/').last,
                          style: GoogleFonts.poppins(fontSize: 14.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (libelle.text.trim().isEmpty ||
                        desc.text.trim().isEmpty) {
                      Navigator.pop(ctx);
                      return;
                    }
                    setState(() {
                      _constats.insert(
                        0,
                        _Constat(
                          titre: 'Description',
                          texte: desc.text.trim(),
                          medias: media == null ? [] : [media!],
                          commentaireAuteur: 'Maude Hall',
                          commentaire:
                              'Commentaire sur le LearderShirp et developpement',
                        ),
                      );
                    });
                    Navigator.pop(ctx);
                  },
                  child: Text(
                    'Ajouter',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// ---------- SLIVER TAB HEADER
class _TabsDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabsDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 4;

  @override
  double get minExtent => tabBar.preferredSize.height + 4;

  @override
  bool shouldRebuild(covariant _TabsDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar;
}

/// ---------- HEADER (titre + méta + bouton)
class _Header extends StatelessWidget {
  const _Header({required this.blue, required this.onBlue});
  final Color blue;
  final Color onBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Audit sur le contrôle qualité des OTC dans le departement gestion produits',
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              _Meta(label: 'Date', value: '12-03-25'),
              SizedBox(width: 18),
              _Meta(label: 'Ref', value: 'AZE-ABA-AUA'),
              SizedBox(width: 18),
              _Meta(label: 'Ver', value: '01'),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 44,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: blue, width: 1.6),
                    foregroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Soumettre a la validation',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13.5),
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(color: Colors.black54),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

/// ---------- TABS CONTENT

class _DescriptionTab extends StatelessWidget {
  const _DescriptionTab({
    required this.title,
    required this.label,
    required this.value,
  });

  final TextStyle title, label, value;

  @override
  Widget build(BuildContext context) {
    Widget tile(String k, String v) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k, style: value),
          Text(v, style: label),
        ],
      ),
    );

    Widget point(String t, String d, String ref) => _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Titre', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(t, style: value),
          const Divider(height: 14),
          Text('Description', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(d, style: value),
          const Divider(height: 14),
          Text('Reference', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(ref, style: value),
        ],
      ),
    );

    Widget docItem(String name) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.poppins(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 26),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tile('Date de debut', 'Lun 04 Mars.2025'),
            tile('Date fin', 'Lun 04 Mars.2025'),
          ],
        ),
        const Divider(height: 6),
        tile('Audité', 'Jean yves KOSSI PAUL'),
        const Divider(height: 6),
        tile(
          'Processus concerné',
          'Marketing internationnal et developpement des ventes regionales',
        ),
        const SizedBox(height: 14),
        Text('Points à controler', style: title),
        const SizedBox(height: 8),
        point(
          'LearderShirp et developpement',
          'Marketing internationnal et developpement des ventes regionales arketing internationnal',
          'ISO 9001',
        ),
        const SizedBox(height: 10),
        point(
          'LearderShirp et developpement',
          'Marketing internationnal et developpement des ventes regionales arketing internationnal',
          'ISO 9001',
        ),
        const SizedBox(height: 18),
        Text('Documentations', style: title),
        const SizedBox(height: 8),
        ...List.generate(
          2,
          (index) => _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tile('Requete de documents', 'LearderShirp et developpement'),
                const Divider(height: 6),
                const SizedBox(height: 6),
                Text(
                  'Document mis a disposition',
                  style: label.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                docItem('document de presentation'),
                docItem('document de presentation'),
                const Divider(height: 6),
                const SizedBox(height: 6),
                Text(
                  'Commetaire',
                  style: label.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const _Avatar('MH'),
                    const SizedBox(width: 10),
                    Text('Maude Hall', style: label),
                  ],
                ),
                Text(
                  'Commentaire sur le LearderShirp et developpement\nsur le LearderShirp et developpement',
                  style: value,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.reply, size: 18, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      'Repondre',
                      style: GoogleFonts.poppins(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ConstatsTab extends StatelessWidget {
  const _ConstatsTab({required this.constats});
  final List<_Constat> constats;

  @override
  Widget build(BuildContext context) {
    Widget pdf(String name) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.poppins(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 90),
      itemCount: constats.length,
      itemBuilder: (_, i) {
        final c = constats[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(c.texte, style: GoogleFonts.poppins()),
                const SizedBox(height: 10),
                ...c.medias.map(pdf),
                const Divider(height: 24),
                Text(
                  'Commentaire',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const _Avatar('MH'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${c.commentaireAuteur}\n${c.commentaire}',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.reply, size: 18, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      'Repondre',
                      style: GoogleFonts.poppins(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ResultatsTab extends StatelessWidget {
  const _ResultatsTab({required this.items});
  final List<_ResultItem> items;

  Color _statutColor(_Statut s) {
    switch (s) {
      case _Statut.conforme:
        return const Color(0xFF00A389);
      case _Statut.nonConforme:
        return const Color(0xFFE53935);
      case _Statut.observation:
        return const Color(0xFFF39C12);
    }
  }

  String _label(_Statut s) {
    switch (s) {
      case _Statut.conforme:
        return 'Conforme';
      case _Statut.nonConforme:
        return 'Non Conforme';
      case _Statut.observation:
        return 'Observation';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 26),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.router.push(const AuditControlObjectifRoute());
                },
                label: Text('Ajouter', style: GoogleFonts.inter(fontSize: 15)),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Point de control et objectif',
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Statut : ',
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        _label(e.statut),
                        style: GoogleFonts.poppins(
                          color: _statutColor(e.statut),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    e.point,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(e.resume, style: GoogleFonts.poppins()),
                  const Divider(height: 14),
                  Text(
                    'Preuves',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...e.preuves.map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            p,
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 14),

                  Text(
                    'Conclusion',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Commentaire sur le LearderShirp et developpement sur le LearderShirp et developpement',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),
          ),
        ),
        _Card(
          color: const Color(0xFFE3EDFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Conclusion Générale',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'NON CONFORMITE',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFE53935),
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Rapport de constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat fait pas l’equipe lors de l’audit constat',
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionsTab extends StatelessWidget {
  const _ActionsTab({required this.items});
  final List<_ActionItem> items;

  @override
  Widget build(BuildContext context) {
    final label = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );

    Widget pdf(String name) => Row(
      children: [
        const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
        const SizedBox(width: 8),
        Text(
          name,
          style: GoogleFonts.poppins(decoration: TextDecoration.underline),
        ),
      ],
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 26),
      children: [
        for (final it in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: it.color.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          it.typeBadge,
                          style: GoogleFonts.poppins(
                            color: it.color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Assets.svgs.pen.svg(),
                      const Icon(
                        Icons.delete_outline_rounded,
                        size: 18,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    it.titre,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Processus', style: label),
                  const SizedBox(height: 4),
                  Text(it.processus, style: GoogleFonts.poppins()),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Justifications', style: label),
                      Text(
                        'Ecart',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFE53935),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(it.justification, style: GoogleFonts.poppins()),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Type Origine', style: label),
                            const SizedBox(height: 4),
                            Text(it.origine, style: GoogleFonts.poppins()),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: Text(
                          it.origineType,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Operationalisation', style: label),
                      Text(
                        it.etat,
                        style: GoogleFonts.poppins(
                          color: it.etatColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  pdf(it.pieceJointe),
                  const SizedBox(height: 10),
                  Text('Responsable', style: label),
                  const SizedBox(height: 6),
                  Text(it.responsable, style: GoogleFonts.poppins()),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// ---------- SMALL BUILDING BLOCKS

class _Card extends StatelessWidget {
  const _Card({required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -6,
            offset: Offset(0, 6),
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({
    required this.controller,
    required this.hint,
    required this.title,
    this.minLines = 1,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.black38),
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE6ECF2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE6ECF2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF1565D8),
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFF2DBE8C),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// ---------- DATA MODELS

class _Constat {
  final String titre;
  final String texte;
  final List<String> medias;
  final String commentaireAuteur;
  final String commentaire;

  _Constat({
    required this.titre,
    required this.texte,
    required this.medias,
    required this.commentaireAuteur,
    required this.commentaire,
  });
}

enum _Statut { conforme, nonConforme, observation }

class _ResultItem {
  final String point;
  final String resume;
  final List<String> preuves;
  final _Statut statut;

  _ResultItem({
    required this.point,
    required this.resume,
    required this.statut,
    required this.preuves,
  });
}

class _ActionItem {
  final String typeBadge;
  final Color color;
  final String titre;
  final String processus;
  final String justification;
  final String origine;
  final String origineType;
  final String pieceJointe;
  final String responsable;
  final String etat;
  final Color etatColor;

  _ActionItem({
    required this.typeBadge,
    required this.color,
    required this.titre,
    required this.processus,
    required this.justification,
    required this.origine,
    required this.origineType,
    required this.pieceJointe,
    required this.responsable,
    required this.etat,
    required this.etatColor,
  });
}
