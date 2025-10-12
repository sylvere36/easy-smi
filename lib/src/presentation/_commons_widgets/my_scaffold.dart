import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons/theming/app_color.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final String? appBarTitle;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final double paddingHorizontale;
  const MyScaffold({
    super.key,
    this.appBar,
    this.appBarTitle,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.paddingHorizontale = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // ---- Blue curved background
          Positioned.fill(
            child: CustomPaint(
              painter: _HeaderWavePainter(color: AppColors.primary),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar:
                appBar ??
                AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: false,
                  leading: IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),

                  title: Text(
                    appBarTitle ?? '',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
            body: Padding(
              padding: EdgeInsets.only(
                left: paddingHorizontale,
                right: paddingHorizontale,
                top: 9,
              ),
              child: body,
            ),
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            drawer: drawer,
            drawerDragStartBehavior: drawerDragStartBehavior,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            drawerScrimColor: drawerScrimColor,
            endDrawer: endDrawer,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            floatingActionButtonLocation: floatingActionButtonLocation,
            onDrawerChanged: onDrawerChanged,
            onEndDrawerChanged: onEndDrawerChanged,
            persistentFooterAlignment: persistentFooterAlignment,
            persistentFooterButtons: persistentFooterButtons,
            primary: primary,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            restorationId: restorationId,
          ),
        ],
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;
  _HeaderWavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final sizeHeight = 1350;

    // Big header block with a curved bottom edge (wavy)
    final Path p = Path()
      ..moveTo(0, 0)
      ..lineTo(0, sizeHeight * 0.03)
      ..quadraticBezierTo(
        size.width * 0.02,
        sizeHeight * 0.085,
        size.width * 0.08,
        sizeHeight * 0.085,
      )
      ..lineTo(size.width * 0.88, sizeHeight * 0.08)
      ..quadraticBezierTo(
        size.width * 0.98,
        sizeHeight * 0.08,
        size.width,
        sizeHeight * 0.09,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(p, paint);
  }

  @override
  bool shouldRepaint(covariant _HeaderWavePainter oldDelegate) =>
      oldDelegate.color != color;
}
