import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/app_localizations.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onbarding';
  const OnboardingPage({super.key, this.onFinish});

  /// Callback fired when the user completes the onboarding (last "Suivant").
  final VoidCallback? onFinish;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  final Color _blue = AppColors.primary;

  final pageLength = 2;

  // Pages data
  List<_OnbData> _pages(AppLocalizations appLocalizations) => [
    _OnbData(
      title: appLocalizations.onbaordingTitle1,
      subtitle: appLocalizations.onbaordingSubTitle1,
      imagePath: Assets.images.onboarding1.path,
    ),
    _OnbData(
      title: appLocalizations.onbaordingTitle2,
      subtitle: appLocalizations.onbaordingSubTitle2,
      imagePath: Assets.images.onboarding2.path,
    ),
  ];

  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // -- UI helpers -------------------------------------------------------------

  TextStyle get _titleStyle =>
      GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w700);

  TextStyle get _subtitleStyle =>
      GoogleFonts.montserrat(fontSize: 16, color: const Color(0xff696969));

  // -- Actions ----------------------------------------------------------------

  void _next() {
    if (_index < pageLength - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // Finished
      widget.onFinish?.call();
      context.pushRoute(const LoginRoute());
    }
  }

  void _skip() {
    widget.onFinish?.call();
    context.pushRoute(const LoginRoute());
  }

  // -- Build ------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final appLocalisations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.pattern.provider(),
              opacity: 0.07,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // PageView
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pageLength,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (context, i) {
                    final data = _pages(appLocalisations)[i];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: const Color(0xFFF3F6F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  data.imagePath!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          // Title
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              data.title,
                              textAlign: TextAlign.center,
                              style: _titleStyle,
                            ),
                          ),

                          // Subtitle
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              data.subtitle,
                              textAlign: TextAlign.center,
                              style: _subtitleStyle,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Dots indicator (center)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(pageLength, (dot) {
                          final active = dot == _index;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: active ? 17 : 12,
                              height: active ? 17 : 12,
                              decoration: BoxDecoration(
                                color: active ? _blue : _blue.withAlpha(123),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                      child: Row(
                        children: [
                          // Skip
                          TextButton(
                            onPressed: _skip,
                            child: Text(
                              appLocalisations.skip,
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          // Spacer to push Next to the right
                          const Spacer(),

                          // Next / Finish
                          TextButton.icon(
                            onPressed: _next,
                            iconAlignment: IconAlignment.end,
                            icon: _index == pageLength - 1
                                ? null
                                : const Icon(Icons.arrow_forward, size: 18),
                            label: Text(
                              _index == pageLength - 1
                                  ? appLocalisations.done
                                  : appLocalisations.next,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: TextButton.styleFrom(foregroundColor: _blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -- Data holder for a single onboarding page --------------------------------
class _OnbData {
  final String title;
  final String subtitle;
  final String? imagePath;
  const _OnbData({required this.title, required this.subtitle, this.imagePath});
}
