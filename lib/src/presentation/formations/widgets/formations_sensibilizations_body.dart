import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/campaign/campaigns_bloc.dart';
import '../../../application/formation/formations_bloc.dart';
import '../../../domain/formation/models/formation_item.dart';
import '../../../domain/formation/models/my_formation.dart';
import '../../_commons/helpers/image_helper.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/search_field_widget.dart';
import '../../_shimmers/card_shimmer.dart';

class FormationsSensibilizationsBody extends StatefulWidget {
  const FormationsSensibilizationsBody({super.key, required this.initialPage});
  final int initialPage; // 1: In progress, 2: Formations, 3: Sensibilizations
  @override
  State<FormationsSensibilizationsBody> createState() =>
      _FormationsSensibilizationsBodyState();
}

class _FormationsSensibilizationsBodyState
    extends State<FormationsSensibilizationsBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;
  final TextEditingController _searchFormations = TextEditingController();
  final TextEditingController _searchMyFormations = TextEditingController();
  final TextEditingController _searchMySensibilizations =
      TextEditingController();

  // Dummy data (replace with your API models)

  @override
  void initState() {
    super.initState();
    _tab = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage - 1,
    );
  }

  @override
  void dispose() {
    _tab.dispose();
    _searchFormations.dispose();
    _searchMyFormations.dispose();
    _searchMySensibilizations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grey = Colors.grey.shade600;

    return BlocBuilder<FormationsBloc, FormationsState>(
      builder: (context, state) {
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // Header card
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: _HeaderProfile(
                  name: 'Mon planning de competence',
                  statusLabel: 'CONFORME',
                  statusColor: Color(0xFF1FBF75),
                  expireText: 'expire le 17 Oct 2026',
                  avatarUrl:
                      'https://images.unsplash.com/photo-1607746882042-944635dfe10e?w=600&q=80',
                ),
              ),
            ),

            // Competences (your 3 rows)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: _CompetencesTable(
                  items: const [
                    'Formation ISO 9001 & ISO 45001',
                    'Formation ISO 9001 & ISO 45001',
                    'Formation ISO 9001 & ISO 45001',
                  ],
                  trailingText: 'Recommandé',
                  onSeeMore: () {},
                ),
              ),
            ),

            // The sticky TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                child: Material(
                  color: theme.scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: TabBar(
                      controller: _tab,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelColor: theme.colorScheme.primary,
                      unselectedLabelColor: const Color(0xFF475467),
                      indicatorColor: theme.colorScheme.primary,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: .1,
                      ),
                      tabs: [
                        _BadgeTab(
                          text: 'En cours',
                          count: state.itemsMyFormations.length,
                        ),
                        const Tab(text: 'Formations'),
                        const Tab(text: 'Sensibilisations'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

          // The inner scrollers (each tab owns its own scroll)
          body: TabBarView(
            controller: _tab,
            children: [
              // TAB 1 – "En cours": search + list with progress
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 20),
                        child: SearchFieldWidget(
                          controller: _searchMyFormations,
                          onChanged: (value) {
                            context.read<FormationsBloc>().add(
                              FormationsEvent.searchMyFormationsRequested(
                                query: value,
                              ),
                            );
                          },
                          onClear: () {
                            _searchMyFormations.text = '';
                            context.read<FormationsBloc>().add(
                              const FormationsEvent.searchMyFormationsRequested(
                                query: '',
                              ),
                            );
                          },
                        ),
                      ), // scrolls with content
                    ),
                  ),
                  state.isLoadingMyFormations == true
                      ? SliverList.separated(
                          itemBuilder: (_, _) => const SizedBox(
                            height: 150,
                            child: Center(child: CardShimmer()),
                          ),
                          itemCount: 6,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 18),
                        )
                      : state.itemsMyFormations.isEmpty
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(child: EmptyWidget.noData()),
                          ),
                        )
                      : SliverList.separated(
                          itemCount: state.itemsMyFormations.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 18),
                          itemBuilder: (ctx, i) {
                            final c = state.itemsMyFormations[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    FormationDisplayRoute(
                                      formationId: c.formation.id,
                                    ),
                                  );
                                },
                                child: _ProgressCard(
                                  title: c.formation.title,
                                  cover:
                                      c.formation.imageUrl ?? c.formation.image,
                                  done: c.totalLessonsDone,
                                  total: c.totalLessons,
                                  onPlay: () {},
                                  myFormation: c,
                                ),
                              ),
                            );
                          },
                        ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),

              // Tab 2: Formations (grid)
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SearchFieldWidget(
                        controller: _searchFormations,
                        onChanged: (value) {
                          context.read<FormationsBloc>().add(
                            FormationsEvent.searchFormationRequested(
                              query: value,
                            ),
                          );
                        },
                        onClear: () {
                          _searchFormations.text = '';
                          context.read<FormationsBloc>().add(
                            const FormationsEvent.searchFormationRequested(
                              query: '',
                            ),
                          );
                        },
                      ), // scrolls with content
                    ),
                  ),
                  state.isLoading == true
                      ? SliverList.separated(
                          itemBuilder: (_, _) => const SizedBox(
                            height: 150,
                            child: Center(child: CardShimmer()),
                          ),
                          itemCount: 6,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 18),
                        )
                      : state.items.isEmpty
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(child: EmptyWidget.noData()),
                          ),
                        )
                      : _GridCourses(
                          items: state.items,
                          emptyPadding: const EdgeInsets.only(bottom: 24),
                          titleColor: theme.colorScheme.onSurface,
                          subtitleColor: grey,
                        ),
                ],
              ),

              // Tab 3: Sensibilisation (same grid)
              BlocBuilder<CampaignsBloc, CampaignsState>(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: _SearchField(
                            controller: _searchMySensibilizations,
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        sliver: SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(child: EmptyWidget.noData()),
                          ),
                        ),
                      ),

                      // _GridCourses(
                      //   items: _grid,
                      //   isCourse: false,
                      //   emptyPadding: const EdgeInsets.only(bottom: 24),
                      //   titleColor: theme.colorScheme.onSurface,
                      //   subtitleColor: grey,
                      // ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// HEADER — avatar + status row
class _HeaderProfile extends StatelessWidget {
  const _HeaderProfile({
    required this.name,
    required this.statusLabel,
    required this.statusColor,
    required this.expireText,
    required this.avatarUrl,
  });

  final String name;
  final String statusLabel;
  final Color statusColor;
  final String expireText;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),

      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.router.push(const ProfileRoute());
            },
            child: CircleAvatar(
              radius: 34,
              backgroundColor: AppColors.primary,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Wrap(
                      children: [
                        Text(
                          'STATUT : ',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          statusLabel,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: statusColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          expireText,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
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

/// TABLE — 3 competence lines with small header and “( Voir plus )”
class _CompetencesTable extends StatelessWidget {
  const _CompetencesTable({
    required this.items,
    required this.trailingText,
    required this.onSeeMore,
  });

  final List<String> items;
  final String trailingText;
  final VoidCallback onSeeMore;

  @override
  Widget build(BuildContext context) {
    final rowStyle = TextStyle(fontSize: 13.5, color: Colors.grey.shade800);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // header row
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F4FA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Competences',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
                InkWell(
                  onTap: onSeeMore,
                  child: const Text(
                    '( Voir plus )',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF246BFD),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // lines
          for (final text in items)
            Container(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F5FF),
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(text, style: rowStyle)),
                  Text(
                    trailingText,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Colors.black54,
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

/// Sticky TabBar delegate
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => kTextTabBarHeight + 16; // height + padding
  @override
  double get maxExtent => kTextTabBarHeight + 16;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) =>
      oldDelegate.child != child;
}

class _BadgeTab extends StatelessWidget {
  const _BadgeTab({required this.text, required this.count});

  final String text;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (count > 0) ...[
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF1769FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// SEARCH
class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Rechercher',
        prefixIcon: const Icon(Icons.search_rounded),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}

/// GRID (two columns) for Formations / Sensibilisation
class _GridCourses extends StatelessWidget {
  const _GridCourses({
    required this.items,
    required this.emptyPadding,
    required this.titleColor,
    required this.subtitleColor,
    this.isCourse = true,
  });

  final List<FormationItem> items;
  final EdgeInsets emptyPadding;
  final Color titleColor;
  final Color subtitleColor;
  final bool isCourse;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      sliver: SliverGrid.builder(
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: .78,
        ),
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          final c = items[i];
          return GestureDetector(
            onTap: () {
              if (isCourse) {
                context.router.push(FormationDetailRoute(formationId: c.id));
              } else {
                context.router.push(const SensibilizationDetailRoute());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // cover
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    children: [
                      FutureBuilder<String>(
                        future: getFullImageUrl(c.image),
                        builder: (context, asyncSnapshot) {
                          if (asyncSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (asyncSnapshot.hasError) {
                            return const Center(child: Icon(Icons.error));
                          } else {
                            return AspectRatio(
                              aspectRatio: 1.25,
                              child: Image.network(
                                asyncSnapshot.data!,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // title
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    c.title,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.2,
                      color: titleColor,
                      fontWeight: FontWeight.w600,
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
}

/// BIG progress card (tab En cours)
class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.title,
    required this.cover,
    required this.done,
    required this.total,
    required this.onPlay,
    required this.myFormation,
  });

  final String title;
  final String cover;
  final int done;
  final int total;
  final VoidCallback onPlay;
  final MyFormation myFormation;

  @override
  Widget build(BuildContext context) {
    final progress = (done / total).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // cover + play + quiz chip
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  FutureBuilder<String>(
                    future: getFullImageUrl(cover),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: LoadingWidget());
                      } else if (asyncSnapshot.hasError) {
                        return const Center(child: Icon(Icons.error));
                      } else {
                        return AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            asyncSnapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            // title
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // progress bar + caption
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(6),
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF1769FF)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${done.toString().padLeft(2, '0')} / ${total.toString().padLeft(2, '0')} terminé',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Status chip
            const SizedBox(width: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: myFormation.statusColorValue.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  myFormation.humannizeStatus.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: myFormation.statusColorValue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
