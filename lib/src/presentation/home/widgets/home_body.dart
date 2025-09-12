import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _pageCtrl = PageController();
  late Timer _rotator;
  final _banners = const [
    'https://picsum.photos/seed/smi1/1024/420',
    'https://picsum.photos/seed/smi2/1024/420',
    'https://picsum.photos/seed/smi3/1024/420',
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _rotator = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted) return;
      _index = (_index + 1) % _banners.length;
      _pageCtrl.animateToPage(
        _index,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _rotator.cancel();
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Bannière rotative
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 16 / 7,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          PageView.builder(
                            controller: _pageCtrl,
                            // onPageChanged: (i) {
                            //   setState(() {
                            //     _index = i;
                            //   });
                            // },
                            itemCount: _banners.length,
                            itemBuilder: (_, i) =>
                                Image.network(_banners[i], fit: BoxFit.cover),
                          ),
                          // petit indicateur en bas à droite
                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10),
                          //     child: Container(
                          //       padding: const EdgeInsets.symmetric(
                          //         horizontal: 10,
                          //         vertical: 6,
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Colors.black45,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: Text(
                          //         '${_index + 1}/${_banners.length}',
                          //         style: GoogleFonts.poppins(
                          //           color: Colors.white,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: GoogleFonts.nunito(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),

          _Section(
            icon: Assets.svgs.jamGreen,
            title: 'Actions',
            trailing: const _SeeAll(countLabel: '30'),
            children: const [
              _ActionCard(
                badgeText: 'En retard · il y a 1 semaine',
                badgeColor: Colors.red,
                title:
                    'Renforcement du control qualité dans le departement departement Gestion Produits',
                status: 'Brouillon',
                owner: 'Adeline AITCHEVI',
                inProgress: false,
                unreadBubble: 3,
              ),
              _ActionCard(
                badgeText: 'Échéance · Dans 1 semaine',
                badgeColor: Color(0xFF00A651),
                title:
                    'Renforcement du control qualité dans le departement Gestion Produits',
                status: 'En cours',
                owner: 'Arielle BABATON',
                unreadBubble: 1,
              ),
              _ActionCard(
                badgeText: 'Échéance · Dans 1 semaine',
                badgeColor: Color(0xFF00A651),
                title:
                    'Renforcement du control qualité dans le departement Gestion Produits',
                status: 'En cours',
                owner: 'Arielle BABATON',
              ),
            ],
          ),

          _Section(
            icon: Assets.svgs.jamRed,
            title: 'Evenement non desirables',
            trailing: const _SeeAll(),
            children: const [
              _EventCard(
                imageUrl: 'https://picsum.photos/seed/ev1/600/320',
                level: 'Majeur',
                status: 'En cours',
                title: 'Entrepôt de stockage, zone de stockage',
                site: 'Espace vert du PAC',
              ),
              _EventCard(
                imageUrl: 'https://picsum.photos/seed/ev2/600/320',
                level: 'Majeur',
                status: 'En cours',
                title: 'Entrepôt de stockage, zone de stockage',
                site: 'Espace vert du PAC',
              ),
              _EventCard(
                imageUrl: 'https://picsum.photos/seed/ev3/600/320',
                level: 'Majeur',
                status: 'En cours',
                title: 'Entrepôt de stockage, zone de stockage',
                site: 'Espace vert du PAC',
              ),
            ],
          ),

          _Section(
            icon: Assets.svgs.jamBlue,

            title: 'Inspections',
            trailing: const _SeeAll(),
            children: const [
              _InspectionCard(
                date: '22 / 09 / 25',
                status: 'En cours',
                title:
                    'Inspections sur les activités internes liées aux dechargements des marchandises',
                site: 'Espace vert du PAC',
              ),
              _InspectionCard(
                date: '22 / 09 / 25',
                status: 'En cours',
                title:
                    'Inspections sur les activités internes liées aux dechargements des marchandises',
                site: 'Espace vert du PAC',
              ),
            ],
          ),

          _Section(
            icon: Assets.svgs.jamOrange,
            title: 'Audits',
            trailing: const _SeeAll(),
            children: const [
              _AuditCard(
                tag: 'Interne',
                status: 'En cours',
                title:
                    'Audits sur les activités internes liées aux dechargements des marchandises',
                process: 'Marketing international et developpment',
              ),
              _AuditCard(
                tag: 'Externe',
                status: 'En cours',
                title:
                    'Audits sur les activités internes liées aux dechargements des marchandises',
                process: 'Marketing international et developpment',
              ),
            ],
          ),

          _Section(
            icon: Assets.svgs.jamPurple,

            title: 'Permis à chaud',
            trailing: const _SeeAll(),
            children: const [
              _HotWorkCard(
                level: 'Travail Normal',
                status: 'En cours',
                title:
                    'Permis pour les travaux sur le quai du bateau de dechargements des marchandises',
                site: 'Espace vert du PAC',
                levelColor: Color(0xFF7E59FF),
              ),
              _HotWorkCard(
                level: 'Travail dangereux',
                status: 'En cours',
                title:
                    'Permis pour les travaux sur le quai du bateau de dechargements des marchandises',
                site: 'Espace vert du PAC',
                levelColor: Color(0xFF7E59FF),
              ),
            ],
          ),

          // fond pour respirer
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

/* ========================= Widgets de section ========================= */

class _Section extends StatelessWidget {
  final SvgGenImage icon;
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  const _Section({
    required this.icon,
    required this.title,
    this.trailing,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.dmSans(
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 20),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF3F9),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(child: icon.svg()),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: Text(title, style: titleStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
            // Items
            for (final w in children)
              Padding(padding: const EdgeInsets.only(bottom: 10), child: w),
          ],
        ),
      ),
    );
  }
}

class _SeeAll extends StatelessWidget {
  final String? countLabel;
  const _SeeAll({this.countLabel});

  @override
  Widget build(BuildContext context) {
    final label = 'Voir tout';
    return InkWell(
      onTap: () {},
      child: Text.rich(
        TextSpan(
          text: label,
          children: [
            if (countLabel != null)
              TextSpan(
                text: ' ($countLabel)',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
          ],
        ),
        style: GoogleFonts.nunito(
          color: Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w700,
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

/* ---- Action ---- */
class _ActionCard extends StatelessWidget {
  final String badgeText;
  final Color badgeColor;
  final String title;
  final String status;
  final String owner;
  final bool inProgress;
  final int unreadBubble;

  const _ActionCard({
    required this.badgeText,
    required this.badgeColor,
    required this.title,
    required this.status,
    required this.owner,
    this.inProgress = true,
    this.unreadBubble = 0,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(fontWeight: FontWeight.w700);

    return _CardBase(
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
                  inProgress ? 'En cours' : 'Brouillon',
                  style: GoogleFonts.poppins(
                    color: inProgress ? const Color(0xFF2E6CF6) : Colors.black,
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
    );
  }
}

/* ---- Event ---- */
class _EventCard extends StatelessWidget {
  final String imageUrl;
  final String level;
  final String status;
  final String title;
  final String site;

  const _EventCard({
    required this.imageUrl,
    required this.level,
    required this.status,
    required this.title,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF2E6CF6);

    return _CardBase(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imageUrl,
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
          ),
        ],
      ),
    );
  }
}

/* ---- Inspection ---- */
class _InspectionCard extends StatelessWidget {
  final String date;
  final String status;
  final String title;
  final String site;

  const _InspectionCard({
    required this.date,
    required this.status,
    required this.title,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF2E6CF6);

    return _CardBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // date + statut
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.black45),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    date,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Statut :  ',
                style: GoogleFonts.nunito(
                  color: const Color(0xFF6E7787),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                status,
                style: GoogleFonts.poppins(
                  color: blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
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
    );
  }
}

/* ---- Audit ---- */
class _AuditCard extends StatelessWidget {
  final String tag;
  final String status;
  final String title;
  final String process;

  const _AuditCard({
    required this.tag,
    required this.status,
    required this.title,
    required this.process,
  });

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF2E6CF6);

    return _CardBase(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tag + statut
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                decoration: const BoxDecoration(
                  color: Color(0xFFFABC3D),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    tag,
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
                        color: blue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Processus',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  process,
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ---- Permis à chaud ---- */
class _HotWorkCard extends StatelessWidget {
  final String level;
  final Color levelColor;
  final String status;
  final String title;
  final String site;

  const _HotWorkCard({
    required this.level,
    required this.levelColor,
    required this.status,
    required this.title,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF2E6CF6);

    return _CardBase(
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
                        color: blue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
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
    );
  }
}
