import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ProfileSearchDegreePage extends StatelessWidget {
  static const String routeName = '/profile-search-degree';
  const ProfileSearchDegreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'DIPLOME',
      paddingHorizontale: 0,
      body: _DegreeSelectBody(),
    );
  }
}

class _DegreeSelectBody extends StatefulWidget {
  const _DegreeSelectBody();

  @override
  State<_DegreeSelectBody> createState() => _DegreeSelectBodyState();
}

class _DegreeSelectBodyState extends State<_DegreeSelectBody> {
  final TextEditingController _search = TextEditingController();
  final Color kBlue = const Color(0xFF1963DA);
  final BorderRadius kRadius = BorderRadius.circular(18);

  // Fake data (replace with your real images/texts)
  final List<_Course> _all = List.generate(
    10,
    (i) => _Course(
      title: 'Introduction aux systemes de management Intégré',
      image: i.isEven
          ? 'https://picsum.photos/seed/desk$i/800/600'
          : 'https://picsum.photos/seed/coach$i/800/600',
    ),
  );

  int? _selected; // single select

  List<_Course> get _filtered {
    final q = _search.text.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all
        .where((c) => c.title.toLowerCase().contains(q))
        .toList(growable: false);
  }

  void _onFilter() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          // Scroll
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 22, 28, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _search,
                          onChanged: (_) => setState(() {}),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0E1117),
                          ),

                          decoration: InputDecoration(
                            hintText: 'Recherche une diplôme',
                            contentPadding: const EdgeInsets.only(
                              top: 12,
                              left: 12,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF2F4F7),
                            suffixIcon: const Icon(
                              Icons.search_rounded,
                              color: Color(0xFF9AA0A6),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintStyle: GoogleFonts.nunito(
                              color: const Color(0xFF9AA0A6),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: _onFilter,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F4F7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.tune_rounded,
                                color: Color(0xFF0E1117),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22,
                    crossAxisSpacing: 22,
                    childAspectRatio: .95,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = _filtered[index];
                    final selected = _selected == index;
                    return _CourseTile(
                      course: item,
                      selected: selected,
                      onTap: () => setState(() => _selected = index),
                    );
                  }, childCount: _filtered.length),
                ),
              ),
            ],
          ),

          // Floating "Suivant"
          if (_selected != null)
            Positioned(
              right: 24,
              bottom: 24,
              child: GestureDetector(
                onTap: () {
                  context.router.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Sélection: ${_filtered[_selected!].title}',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: kBlue.withAlpha(128),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 10,
                    ),
                    child: Text(
                      'Suivant',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/* --------------------- course tile --------------------- */

class _Course {
  final String title;
  final String image;
  const _Course({required this.title, required this.image});
}

class _CourseTile extends StatelessWidget {
  final _Course course;
  final bool selected;
  final VoidCallback onTap;
  const _CourseTile({
    required this.course,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(8);

    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image + overlay check
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: radius,
                  child: Image.network(course.image),
                ),
                if (selected)
                  Positioned(
                    right: 10,
                    bottom: 14,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.check,
                          size: 20,
                          color: Color(0xFF16C067),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // title (2 lines)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              course.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0E1117),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
