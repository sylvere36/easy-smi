import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/app_localizations.dart';
import '../../_commons/route/app_router.gr.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  static const String routeName = '/sign-in';
  const SignInPage({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.pattern.provider(),
              fit: BoxFit.cover,
              opacity: 0.07,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Assets.svgs.box.svg(),
                      Text(
                        email,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                      Assets.svgs.edit.svg(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.signIn,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: const Color(0XFF04103B),
                        ),
                      ),

                      // ---- Google button
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            context.router.replaceAll([const HomeRoute()]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Assets.images.google.image(),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 10,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 19,
                                    horizontal: 12,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0XFF1A73E8),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 4,
                                          right: 70,
                                        ),
                                        child: Text(
                                          appLocalizations.continueWithGoogle,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
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

                      // ---- Microsoft button
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            context.router.replaceAll([const HomeRoute()]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Assets.images.microsoft.image(),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 10,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 19,
                                    horizontal: 12,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: Text(
                                          appLocalizations
                                              .continueWithActiveDirectory,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
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
                    ],
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
