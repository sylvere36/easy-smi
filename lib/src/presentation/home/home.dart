import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/app_localizations.dart';
import '../../application/auth/user/authenticated_user_bloc.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons_widgets/badge_widget.dart';
import 'widgets/app_drawer.dart';
import 'widgets/home_body.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _menuOpen = false;
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _ctrl,
    curve: Curves.easeOut,
  );
  late final Animation<Offset> _slide1 = Tween(
    begin: const Offset(0, .15),
    end: Offset.zero,
  ).animate(_fade);
  late final Animation<Offset> _slide2 = Tween(
    begin: const Offset(0, .25),
    end: Offset.zero,
  ).animate(_fade);
  late final Animation<Offset> _slide3 = Tween(
    begin: const Offset(0, .35),
    end: Offset.zero,
  ).animate(_fade);

  final Color _navy = const Color(0xFF1E2A47);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticatedUserBloc>(
      context,
    ).add(const AuthenticatedUserEvent.fetchRequested());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggleFabMenu() {
    setState(() => _menuOpen = !_menuOpen);
    if (_menuOpen) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
  }

  // ---------- DIALOGS ----------
  Future<void> _showInspectionDialog() async {
    final items = <_InspectionChoice>[
      _InspectionChoice(
        dueLabel: 'Prévu pour :',
        dueDate: 'Jeu 10 Aout 2025',
        isLate: false,
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
      ),
      _InspectionChoice(
        dueLabel: 'Prévu pour :',
        dueDate: 'Jeu 10 Aout 2025',
        isLate: false,
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
      ),
      _InspectionChoice(
        dueLabel: 'En retard',
        dueDate: 'Jeu 10 Aout 2025',
        isLate: true,
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
      ),
      _InspectionChoice(
        dueLabel: 'Prévu pour :',
        dueDate: 'Jeu 10 Aout 2025',
        isLate: false,
        title:
            'Inspections sur les activités internes liées aux dechargements des marchandises',
      ),
    ];

    await showDialog<void>(
      context: context,
      builder: (_) => _RoundedDialog(
        title: 'Veuillez choisir l’inspection à demarrer',
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (_, _) => const Divider(height: 12),
          itemBuilder: (_, i) {
            final it = items[i];
            final c = it.isLate ? Colors.red : const Color(0xFF00A651);
            return InkWell(
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Inspection choisie: ${it.title}')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // due label
                    Row(
                      spacing: 10,
                      children: [
                        Text(
                          it.dueLabel,
                          style: GoogleFonts.mulish(
                            color: c,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          it.dueDate,
                          style: GoogleFonts.mulish(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      it.title,
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showHotWorkDialog() async {
    final items = <_HotWorkChoice>[
      _HotWorkChoice(
        level: 'Normal',
        levelColor: const Color(0xFF2D7BFF),
        site: 'Zone Portuaire Nord EST',
        title:
            'Soudure du pont metalique du navire S01 lié aux dechargements des marchandises',
      ),
      _HotWorkChoice(
        level: 'Normal',
        levelColor: const Color(0xFF2D7BFF),
        site: 'Plage Fidjrossè',
        title:
            'Soudure du pont metalique du navire S01 lié aux dechargements des marchandises',
      ),
      _HotWorkChoice(
        level: 'Dangereux',
        levelColor: Colors.red,
        site: 'Plage Fidjrossè',
        title:
            'Soudure du pont metalique du navire S01 lié aux dechargements des marchandises',
      ),
      _HotWorkChoice(
        level: 'Normal',
        levelColor: const Color(0xFF2D7BFF),
        site: 'Zone Portuaire Nord EST',
        title:
            'Soudure du pont metalique du navire S01 lié aux dechargements des marchandises',
      ),
    ];

    await showDialog<void>(
      context: context,
      builder: (_) => _RoundedDialog(
        title: 'Veuillez choisir le travail à chaud',
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (_, _) => const Divider(height: 12),
          itemBuilder: (_, i) {
            final it = items[i];
            return InkWell(
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Travail à chaud: ${it.title}')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // first line: level + site
                    Row(
                      spacing: 10,
                      children: [
                        Text(
                          it.level,
                          style: GoogleFonts.mulish(
                            color: it.levelColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            it.site,
                            style: GoogleFonts.mulish(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      it.title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Assets.svgs.menu.svg(),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          appLocalizations.appName,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            // ignore: use_full_hex_values_for_flutter_colors
            color: const Color(0xff0f0f0fa3).withAlpha(134),
          ),
        ),
        actions: [
          BadgeIcon(
            hasNotification: true,
            icon: Assets.svgs.officeStampDocument,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BadgeIcon(
              hasNotification: true,
              icon: Assets.svgs.bellBold,
              onTap: () => context.router.push(const NotificationsRoute()),
            ),
          ),
        ],
      ),
      body: const HomeBody(),
      // FAB with glow and toggling icon
      floatingActionButton: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_menuOpen)
            IgnorePointer(
              ignoring: !_menuOpen,
              child: AnimatedOpacity(
                opacity: _menuOpen ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SlideTransition(
                      position: _slide1,
                      child: _MenuPill(
                        label: 'Inspections',
                        color: _navy,
                        onTap: () {
                          _toggleFabMenu();
                          _showInspectionDialog();
                        },
                      ),
                    ),
                    SlideTransition(
                      position: _slide2,
                      child: _MenuPill(
                        label: 'Evenements',
                        color: _navy,
                        onTap: () {
                          _toggleFabMenu();
                          context.router.push(const AddNewBadEventsRoute());
                        },
                      ),
                    ),
                    SlideTransition(
                      position: _slide3,
                      child: _MenuPill(
                        label: 'Contrôle',
                        color: _navy,
                        onTap: () {
                          _toggleFabMenu();
                          _showHotWorkDialog();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          _GlowingFab(
            open: _menuOpen,
            mainColor: _navy,
            onPressed: _toggleFabMenu,
          ),
        ],
      ),
    );
  }
}

/* ===================== Helpers / Widgets ===================== */
class _MenuPill extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _MenuPill({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 156,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowingFab extends StatelessWidget {
  final bool open;
  final VoidCallback onPressed;
  final Color mainColor;

  const _GlowingFab({
    required this.open,
    required this.onPressed,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      onPressed: onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        transitionBuilder: (c, anim) =>
            RotationTransition(turns: anim, child: c),
        child: Icon(
          open ? Icons.close_rounded : Icons.add_rounded,
          key: ValueKey(open),
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _RoundedDialog extends StatelessWidget {
  final String title;
  final Widget child;

  const _RoundedDialog({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8,
      insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 450),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title + close
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: GoogleFonts.mulish(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () => Navigator.pop(context),

                    child: Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5),
                      ),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

/* ===================== Models ===================== */

class _InspectionChoice {
  final String dueLabel;
  final String dueDate;
  final bool isLate;
  final String title;

  _InspectionChoice({
    required this.dueLabel,
    required this.dueDate,
    required this.isLate,
    required this.title,
  });
}

class _HotWorkChoice {
  final String level;
  final Color levelColor;
  final String site;
  final String title;

  _HotWorkChoice({
    required this.level,
    required this.levelColor,
    required this.site,
    required this.title,
  });
}
