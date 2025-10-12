import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../application/quizz/quizz_bloc.dart';
import '../../../../domain/quizz/models/quizz_item.dart';
import '../../../_commons/helpers/image_helper.dart';
import '../../../_commons/route/app_router.gr.dart';
import '../../../_commons_widgets/empty_widget.dart';
import '../../../_commons_widgets/loading_widget.dart';
import '../../../_commons_widgets/search_field_widget.dart';
import '../../../_shimmers/card_shimmer.dart';

class CertificationsListBody extends StatefulWidget {
  const CertificationsListBody({super.key});

  @override
  State<CertificationsListBody> createState() => _CertificationsListBodyState();
}

class _CertificationsListBodyState extends State<CertificationsListBody> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizzBloc, QuizzState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 20),
                        child: SearchFieldWidget(
                          controller: _search,
                          onChanged: (value) {
                            context.read<QuizzBloc>().add(
                              QuizzEvent.searchRequested(query: value),
                            );
                          },
                          onClear: () {
                            _search.text = '';
                            context.read<QuizzBloc>().add(
                              const QuizzEvent.searchRequested(query: ''),
                            );
                          },
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 12),
                    //   child: InkWell(
                    //     onTap: () {},
                    //     borderRadius: BorderRadius.circular(12),
                    //     child: Container(
                    //       width: 44,
                    //       height: 44,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(12),
                    //         border: Border.all(color: const Color(0xFFE5E7EB)),
                    //       ),
                    //       child: const Icon(
                    //         Icons.tune,
                    //         color: Color(0xFF0F172A),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.isLoading)
                        ...List.generate(6, (index) => const CardShimmer()),
                      if (state.items.isEmpty) EmptyWidget.noData(),
                      ...state.items.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: _CertificationTile(
                            title: e.title,
                            isCertified: e.certification == 1,
                            quizzItem: e,
                            onTap: () => context.router.push(
                              CertificationDetailRoute(quizzItem: e),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class _CertificationTile extends StatelessWidget {
  const _CertificationTile({
    required this.title,
    required this.isCertified,
    required this.quizzItem,
    required this.onTap,
  });

  final String title;
  final bool isCertified;
  final QuizzItem quizzItem;
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
                if (quizzItem.image.isNotEmpty)
                  FutureBuilder<String>(
                    future: getFullImageUrl(quizzItem.image),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: LoadingWidget());
                      } else if (asyncSnapshot.hasError) {
                        return const Center(child: Icon(Icons.error));
                      } else {
                        return SizedBox(
                          width: 64,
                          height: 64,
                          child: Image.network(
                            asyncSnapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  )
                else
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1E6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Assets.images.quizz.image(),
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
                        if (isCertified)
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
