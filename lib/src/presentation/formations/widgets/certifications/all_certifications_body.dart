import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../_commons/route/app_router.gr.dart';

class CertificationsListBody extends StatefulWidget {
  const CertificationsListBody({super.key});

  @override
  State<CertificationsListBody> createState() => _CertificationsListBodyState();
}

class _CertificationsListBodyState extends State<CertificationsListBody> {
  final _search = TextEditingController();
  final _all = List<String>.generate(
    12,
    (i) => 'Orientation client  – Au coeur de la confiances',
  );

  String _q = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _all
        .where((e) => e.toLowerCase().contains(_q.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _search,
                    onChanged: (v) => setState(() => _q = v),
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF101828),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Recherche',
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xFF98A2B3),
                        fontWeight: FontWeight.w600,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF6B7280),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFF2563EB)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: const Icon(Icons.tune, color: Color(0xFF0F172A)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final title = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _CertificationTile(
                    title: title,
                    onTap: () {
                      context.router.push(const CertificationDetailRoute());
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificationTile extends StatelessWidget {
  const _CertificationTile({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(color: const Color(0xFFE5E7EB)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 7, 12),
            child: Row(
              children: [
                // Image arrondie (remplace par ton asset)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Assets.images.quizz.image(
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),

                // Titre + "Certification"
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.verified_outlined,
                                size: 18,
                                color: Color(0xFF6B7280),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  'Certification',
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: const Color(0xFF6B7280),
                                    fontWeight: FontWeight.w400,
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
          ),
        ),
      ),
    );
  }
}
