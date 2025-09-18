import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons/route/app_router.gr.dart';

@RoutePage()
class StartInspectionPage extends StatefulWidget {
  static const String routeName = '/start-inspection';
  const StartInspectionPage({super.key});

  @override
  State<StartInspectionPage> createState() => _StartInspectionPageState();
}

class _StartInspectionPageState extends State<StartInspectionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  bool _running = false;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _running = !_running);
    // if (_running) {
    //   _pulse.repeat();

    // } else {
    //   _pulse.stop();

    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: Stack(
          children: [
            // ---- gradient background + bubbles
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1567E0), Color(0xFF0E5ED7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            const _Bubbles(), // décor
            // ---- middle white band + title card
            Align(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // le ruban blanc derrière
                  Container(
                    height: 66,
      
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // cartouche
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x551E40FF),
                          blurRadius: 22,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 26, 16, 26),
                      child: Text(
                        'INSPECTION SUR LA SECURITE\nZONE DES PRODUITS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // ---- big play button + cancel
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // bouton pulse
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: AnimatedBuilder(
                      animation: _pulse,
                      builder: (context, child) {
                        // halo respirant
                        final scale = 1.0 + sin(_pulse.value * pi) * 0.12;
                        return Transform.scale(
                          scale: _running ? scale : 1.0,
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          _toggle();
                          if (_running) {
                            context.router.push(
                              const StartInspectionDetailRoute(),
                            );
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFF5BA0FF).withOpacity(.35),
                                const Color(0xFF0E3E88).withOpacity(.95),
                              ],
                              radius: .9,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x335BA0FF),
                                blurRadius: 18,
                                spreadRadius: 2,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  _running
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  size: 50,
                                  color: const Color(0xFF113A86),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      
                  // bouton Annuler
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 26),
                    child: SizedBox(
                      width: 150,
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          if (_running) _toggle();
                          Navigator.of(context).maybePop();
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7EE0FF), Color(0xFF37B8F1)],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'ANNULER',
                              style: TextStyle(
                                color: Color(0xFF122033),
                                fontWeight: FontWeight.w800,
                                fontSize: 17,
                                letterSpacing: .5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------- Background bubbles -------------------- */

class _Bubbles extends StatelessWidget {
  const _Bubbles();

  @override
  Widget build(BuildContext context) {
    Color c(double o) => Colors.white.withOpacity(o);
    return IgnorePointer(
      child: Stack(
        children: [
          _bubble(left: -60, top: 120, size: 180, color: c(.12)),
          _bubble(right: -40, top: 140, size: 190, color: c(.12)),
          _bubble(left: 40, top: 360, size: 170, color: c(.12)),
          _bubble(right: 28, top: 420, size: 180, color: c(.12)),
          _bubble(left: 24, bottom: 260, size: 160, color: c(.12)),
          _bubble(right: 20, bottom: 330, size: 160, color: c(.12)),
          _bubble(left: -30, bottom: 120, size: 140, color: c(.12)),
        ],
      ),
    );
  }

  Widget _bubble({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double size,
    required Color color,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
