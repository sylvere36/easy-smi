import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/slider/sliders_bloc.dart';
import '../../_commons/helpers/image_helper.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

class SlidersWidget extends StatefulWidget {
  const SlidersWidget({super.key});

  @override
  State<SlidersWidget> createState() => _SlidersWidgetState();
}

class _SlidersWidgetState extends State<SlidersWidget> {
  final _pageCtrl = PageController();
  late Timer _rotator;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _rotator = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted || !_pageCtrl.hasClients) return;
      final items = context.read<SlidersBloc>().state.items;
      if (items.length < 2) return;
      final next = (_index + 1) % items.length;
      _pageCtrl.animateToPage(
        next,
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: BlocBuilder<SlidersBloc, SlidersState>(
        builder: (context, slidersState) {
          final items = slidersState.items;
          return Column(
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
                      if (items.isEmpty)
                        PageView.builder(
                          controller: _pageCtrl,
                          itemCount: 1,
                          itemBuilder: (_, _) =>
                              Container(color: Colors.black12),
                        )
                      else
                        PageView.builder(
                          controller: _pageCtrl,
                          itemCount: items.length,
                          onPageChanged: (i) {
                            if (!mounted) return;
                            setState(() => _index = i);
                          },
                          itemBuilder: (_, i) {
                            final slider = items[i];
                            return FutureBuilder<String>(
                              future: getFullImageUrl(slider.image),
                              builder: (context, snap) {
                                final url = snap.data;
                                if (url == null || url.isEmpty) {
                                  return Container(color: Colors.black12);
                                }
                                return GestureDetector(
                                  onTap: () {
                                    if (slider.type == 'formation' &&
                                        slider.formation != null) {
                                      context.router.push(
                                        FormationDetailRoute(
                                          formationId: slider.formation!.id,
                                        ),
                                      );
                                    } else if (slider.type == 'campaign' &&
                                        slider.campaign != null) {
                                      context.router.push(
                                        FormationsSensibilizationsRoute(
                                          initialPage: 3,
                                        ),
                                      );
                                    }
                                  },
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(url, fit: BoxFit.cover),
                                      // Petite carte en bas à droite
                                      Positioned(
                                        bottom: 12,
                                        right: 12,
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 200,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withValues(
                                              alpha: 0.65,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                slider.titleFromType,
                                                style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 2,
                                                ),
                                                child: Text(
                                                  slider.subtitleFromType,
                                                  style: GoogleFonts.dmSans(
                                                    color: Colors.white70,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                          },
                        ),
                    ],
                  ),
                ),
              ),
              if (items.length > 1)
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      for (var i = 0; i < items.length; i++)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == _index
                                ? AppColors.primary
                                : Colors.black26,
                          ),
                        ),

                      const Spacer(flex: 8),
                      InkWell(
                        onTap: () {
                          if (items.isEmpty) return;
                          final slider = items[_index];
                          if (slider.type == 'formation' &&
                              slider.formation != null) {
                            context.router.push(
                              FormationDetailRoute(
                                formationId: slider.formation!.id,
                              ),
                            );
                          } else if (slider.type == 'campaign' &&
                              slider.campaign != null) {
                            context.router.push(
                              FormationsSensibilizationsRoute(initialPage: 3),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.65),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Voir détails',
                            style: GoogleFonts.dmSans(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
