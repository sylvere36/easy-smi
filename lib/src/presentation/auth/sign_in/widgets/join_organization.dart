import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../_commons/route/app_router.gr.dart';
import '../../../_commons/theming/app_color.dart';

class JoinOrganization extends StatefulWidget {
  const JoinOrganization({super.key});

  @override
  State<JoinOrganization> createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  final _formKey = GlobalKey<FormState>();
  final _mailCtrl = TextEditingController();

  final Color _blue = AppColors.primary; // main blue
  final Color _bgGrey = const Color(0xFFF1F2F4);

  @override
  void dispose() {
    _mailCtrl.dispose();
    super.dispose();
  }

  TextStyle get _title => GoogleFonts.nunito(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 22,
  );

  TextStyle get _small => GoogleFonts.nunito(fontSize: 14);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: _bgGrey,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            return Stack(
              children: [
                // ---- Blue curved background
                Positioned.fill(
                  child: CustomPaint(painter: _HeaderWavePainter(color: _blue)),
                ),

                // ---- Content
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          appLocalizations.joinYourOrganisation,
                          style: _title,
                        ),
                      ),

                      // Illustration placeholder (replace with your image)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Assets.images.login.image(),
                      ),

                      // Card-like lower section
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Helper label
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    appLocalizations.enterYourOrganisation,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                // Email field
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: TextFormField(
                                    controller: _mailCtrl,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) {
                                        return 'Veuillez saisir un mail';
                                      }
                                      final ok = RegExp(
                                        r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                                      ).hasMatch(v.trim());
                                      return ok ? null : 'Mail invalide';
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 14,
                                          ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Assets.svgs.mail.svg(),
                                      ),
                                      hintText: 'Mail Organisation',
                                      hintStyle: GoogleFonts.poppins(
                                        color: const Color(
                                          // ignore: use_full_hex_values_for_flutter_colors
                                          0Xff858891b8,
                                        ).withAlpha(122),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFEDEFFF),

                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: _blue,
                                          width: 1.6,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.red.shade700,
                                          width: 1.6,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.red.shade700,
                                          width: 1.6,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                // Button
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    left: 6,
                                    right: 6,
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _onJoin,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _blue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            26,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),
                                      child: Text(
                                        appLocalizations.join,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Legal text
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 12,
                                    right: 12,
                                  ),
                                  child: Text(
                                    appLocalizations.acceptTermsPrivacyMsg,
                                    textAlign: TextAlign.center,
                                    style: _small.copyWith(
                                      color: const Color(0xFF7C82BA),
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }

  void _onJoin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.router.push(SignInRoute(email: _mailCtrl.text.trim()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Votre ${_mailCtrl.text} est valide !',
            style: GoogleFonts.poppins(),
          ),
        ),
      );
    }
  }
}

/* ===================== Painter for blue header shape ===================== */

class _HeaderWavePainter extends CustomPainter {
  final Color color;
  _HeaderWavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Big header block with a curved bottom edge (wavy)
    final Path p = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.47)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.45,
        size.width * 0.40,
        size.height * 0.55,
      )
      ..quadraticBezierTo(
        size.width * 0.60,
        size.height * 0.72,
        size.width,
        size.height * 0.55,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(p, paint);

    // Rounded blue blob on the right bottom (like the mockup)
    // final Path blob = Path()
    //   ..moveTo(size.width * .60, size.height * .60)
    //   ..quadraticBezierTo(
    //     size.width * .92,
    //     size.height * .48,
    //     size.width * .92,
    //     size.height * .76,
    //   )
    //   ..quadraticBezierTo(
    //     size.width * .70,
    //     size.height * .80,
    //     size.width * .60,
    //     size.height * .60,
    //   )
    //   ..close();

    // canvas.drawPath(blob, paint);
  }

  @override
  bool shouldRepaint(covariant _HeaderWavePainter oldDelegate) =>
      oldDelegate.color != color;
}
