import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/network_video_viewer.dart';

class CourseDisplayBody extends StatefulWidget {
  const CourseDisplayBody({super.key});

  @override
  State<CourseDisplayBody> createState() => _CourseDisplayBodyState();
}

class _CourseDisplayBodyState extends State<CourseDisplayBody>
    with TickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 4, vsync: this);

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // IMAGE + titre + stats + CTA
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header image
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                  child: GestureDetector(
                    onTap: () async {
                      await showNetworkVideoViewer(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?q=80&w=1400&auto=format&fit=crop',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 76,
                            height: 76,
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: Row(
                              children: [
                                _roundSmallIcon(Icons.volume_up_rounded),
                                const SizedBox(width: 8),
                                _roundSmallIcon(Icons.fullscreen_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Title
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    'Introduction aux systemes de\nmanagement Intégré',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                      color: onSurface,
                    ),
                  ),
                ),

                // Progress + text right
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(20),
                          minHeight: 8,
                          value: 0.6, // 06 / 10
                          backgroundColor: Colors.black12,
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '06 / 10 terminé',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // CTA "Leçon 7"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.play_circle_fill_rounded),
                    label: Text(
                      'Leçon 7',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () async {
                      await showNetworkVideoViewer(context);
                    },
                  ),
                ),

                // Chips des infos (leçons, durée, inscrits)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: _InfoColumn(),
                ),
              ],
            ),
          ),

          // ===== Sticky TabBar juste sous l’AppBar =====
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarHeaderDelegate(
              TabBar(
                controller: _tabs,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: 'Aperçu'),
                  Tab(text: 'Leçons'),
                  Tab(text: 'Ressources'),
                  Tab(text: 'Temoignages'),
                ],
              ),
            ),
          ),
        ],

        // ===== Contenu scrollable de chaque tab =====
        body: TabBarView(
          controller: _tabs,
          children: [
            // APERÇU
            _OverviewTab(),

            // LEÇONS
            _LessonsTab(),

            // RESSOURCES
            _ResourcesTab(),

            // TÉMOIGNAGES
            _ReviewsTab(),
          ],
        ),
      ),
    );
  }
}

// --------------------------- widgets de sections -----------------------------

class _OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txt = GoogleFonts.inter(fontSize: 16, height: 1.5);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Text(
          'RESUME',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            letterSpacing: .3,
          ),
        ),
        const SizedBox(height: 8),
        Text(_lorem1, style: txt),
        const SizedBox(height: 16),
        Text(_lorem2, style: txt),
      ],
    );
  }
}

class _LessonsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.25,
    );
    final subtitle = GoogleFonts.inter(
      fontSize: 12,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        const _SectionHeader(
          text: 'Section 1: INTRODUCTION AU SYSTEME DE\nMANAGEMENT INTEGRE',
        ),
        const SizedBox(height: 8),
        ...List.generate(4, (i) => i + 1).map(
          (n) => _LessonTile(
            thumb:
                'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1600&auto=format&fit=crop',
            title: 'Introduction au systeme de management',
            duration: '03:57 minutes',
            leadingCheck: n <= 2,
            index: (n).toString(),
            titleStyle: title,
            subtitleStyle: subtitle,
          ),
        ),
        const SizedBox(height: 16),
        const _SectionHeader(
          text: 'Section 2: INTRODUCTION AU SYSTEME DE\nMANAGEMENT INTEGRE',
        ),
        const SizedBox(height: 8),
        ...List.generate(
          4,
          (i) => _LessonTile(
            thumb:
                'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?q=80&w=1600&auto=format&fit=crop',
            title: 'Introduction au systeme de management',
            duration: '03:57 minutes',
            index: (i + 1).toString(),
            leadingCheck: false,
            titleStyle: title,
            subtitleStyle: subtitle,
          ),
        ),
      ],
    );
  }
}

class _ResourcesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final label = GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Text('Livrets d’exercices', style: label),
        const SizedBox(height: 12),
        ...List.generate(2, (i) => _PdfCard()),
      ],
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chipStyle = GoogleFonts.inter(
      fontSize: 13,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // input
        GestureDetector(
          onTap: () {
            context.router.push(const CommentsRoute());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(14),
            ),
            height: 52,
            alignment: Alignment.centerLeft,
            child: Text('Écrire  un commentaire', style: chipStyle),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              'Commentaire(s) ',
              style: GoogleFonts.inter(fontWeight: FontWeight.w800),
            ),
            const SizedBox(width: 6),
            _countPill('232'),
            const Spacer(),
            TextButton(
              onPressed: () {
                context.router.push(const CommentsRoute());
              },
              child: Text(
                'Voir tout',
                style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...List.generate(7, (i) => const _ReviewItem()),
      ],
    );
  }
}

// --------------------------- petits composants -------------------------------

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TabBarHeaderDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => 52;
  @override
  double get maxExtent => 52;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (overlapsContent)
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.only(left: 8), child: tabBar),
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarHeaderDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar;
}

class _InfoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chipText = GoogleFonts.inter(fontWeight: FontWeight.w700);

    Widget chip(IconData icon, String t1) {
      return Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Text(t1, style: chipText),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 10,
        children: [
          chip(Icons.menu_book_rounded, '10 lecons'),
          chip(Icons.schedule_rounded, '3 Heures'),
          chip(Icons.people_alt_rounded, '2 368 personnes inscrites'),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(fontWeight: FontWeight.w800, height: 1.25),
    );
  }
}

class _LessonTile extends StatefulWidget {
  const _LessonTile({
    required this.thumb,
    required this.title,
    required this.index,
    required this.duration,
    required this.leadingCheck,
    required this.titleStyle,
    required this.subtitleStyle,
  });

  final String thumb, title, duration, index;
  final bool leadingCheck;
  final TextStyle titleStyle, subtitleStyle;

  @override
  State<_LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<_LessonTile> {
  bool isSelect = false;
  @override
  void initState() {
    super.initState();
    isSelect = widget.leadingCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isSelect = !isSelect;
          });
          await showNetworkVideoViewer(context);
        },
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.thumb,
                    width: 210,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isSelect)
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Leçon ${widget.index}', style: widget.subtitleStyle),
                  const SizedBox(height: 3),
                  Text(widget.title, style: widget.titleStyle),
                  const SizedBox(height: 6),
                  Text(widget.duration, style: widget.subtitleStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PdfCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onVar = Theme.of(context).colorScheme.onSurfaceVariant;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: onVar.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .65),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Icon(
                Icons.picture_as_pdf_rounded,
                color: Colors.red,
                size: 36,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Guide de preparation -\nLe materiel necessaires à\nmettre en place',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.download_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    final grey = Theme.of(context).colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFF2BB673),
            child: Text(
              'MH',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Beatrice BOSSOU',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      'Il y a 30 min',
                      style: GoogleFonts.inter(color: grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Les documents fournies ne respectent par les normes internationnales',
                  style: GoogleFonts.inter(height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------- helpers ----------------------------------------

Widget _roundSmallIcon(IconData icon) => CircleAvatar(
  radius: 16,
  backgroundColor: Colors.white70,
  child: Icon(icon, size: 18, color: Colors.black87),
);

Widget _countPill(String text) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  decoration: BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.circular(999),
  ),
  child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
);

// faux contenu
const _lorem1 =
    'La formation est aujourd’hui l’un des petits business les plus accessibles et rentables, surtout dans les zones rurales et semi-urbaines. Il ne nécessite pas de diplôme spécifique ni de gros investissements au départ. En quelques semaines, il est possible de générer des revenus réels grâce à la vente de viande (poulets de chair) ou d’œufs (poules pondeuses). La demande est constante, car la volaille est une source de protéines consommée au quotidien dans de nombreux foyers.';
const _lorem2 =
    'Que ce soit pour nourrir sa famille, lancer un microprojet entrepreneurial, ou diversifier ses sources de revenus, l’élevage peut rapidement devenir un véritable levier de développement personnel et communautaire. De plus, il peut être pratiqué à petite échelle avec des moyens simples, puis agrandi progressivement.';
