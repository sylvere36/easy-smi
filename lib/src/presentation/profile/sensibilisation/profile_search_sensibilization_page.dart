import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ProfileSearchSensibilizationPage extends StatelessWidget {
  static const String routeName = '/profile-search-sensibilization';
  const ProfileSearchSensibilizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'SENSIBILIZATION',
      paddingHorizontale: 0,
      body: _SensibilizationSelectBody(),
    );
  }
}

class _SensibilizationSelectBody extends StatefulWidget {
  const _SensibilizationSelectBody();

  @override
  State<_SensibilizationSelectBody> createState() =>
      _SensibilizationSelectBodyState();
}

class _SensibilizationSelectBodyState
    extends State<_SensibilizationSelectBody> {
  final TextEditingController _search = TextEditingController();
  final Color kBlue = const Color(0xFF1963DA);
  final BorderRadius kRadius = BorderRadius.circular(18);

  int? _selected; // single select

  List<String> listTemp = [];
  List<String> get _filtered {
    final text = 'Maitrise des exigences de la normes ISO 9001';
    listTemp = [];
    // repeat text 10 times
    for (var i = 0; i < 10; i++) {
      listTemp.add(text);
    }
    return listTemp;
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
                            hintText: 'Recherche une competence',
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
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(height: 10),
                  itemBuilder: (context, index) {
                    final item = _filtered[index];
                    final selected = _selected == index;
                    return RadioListTile(
                      groupValue: _selected,
                      value: index,
                      activeColor: AppColors.primary,
                      selected: selected,
                      title: Text(
                        item,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      onChanged: (value) => setState(() => _selected = index),
                    );
                  },
                  itemCount: _filtered.length,
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
                      content: Text('Sélection: ${_filtered[_selected!]}'),
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
