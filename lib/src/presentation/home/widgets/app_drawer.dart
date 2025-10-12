import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../application/auth/user/authenticated_user_bloc.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/comments/avatar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedUserBloc, AuthenticatedUserState>(
      builder: (context, state) {
        return Drawer(
          shape: const RoundedRectangleBorder(),
          child: SafeArea(
            child: Column(
              children: [
                // Header logo + title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ).copyWith(left: 25),
                      child: Column(
                        children: [
                          Assets.images.portCotonou.image(
                            height: 107,
                            width: 119,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'EASY SMI',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Scaffold.of(context).closeDrawer(),
                      icon: const Icon(
                        Icons.close,
                        size: 35,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                // Menu items
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    children: [
                      _drawerItem(
                        icon: Assets.svgs.home,
                        text: 'Inspections',
                        onTap: () {
                          context.router.push(const InspectionsRoute());
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                      _drawerItem(
                        icon: Assets.svgs.document,
                        text: 'Audits',
                        onTap: () {
                          context.router.push(const AuditsRoute());
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                      _drawerItem(
                        icon: Assets.svgs.formation,
                        text: 'Formations',
                        onTap: () {
                          context.router.push(
                            FormationsSensibilizationsRoute(),
                          );
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                      _drawerItem(
                        icon: Assets.svgs.bell,
                        text: 'Sensibilisations',
                        onTap: () {
                          context.router.push(
                            FormationsSensibilizationsRoute(initialPage: 3),
                          );
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                      _drawerItem(
                        icon: Assets.svgs.event,
                        text: 'Evenements',
                        onTap: () {
                          context.router.push(const NewBadEventsRoute());
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                      _drawerItem(
                        icon: Assets.svgs.hot,
                        text: 'Travail à chaud',
                        onTap: () {
                          context.router.push(const HotPermisRoute());
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                    ],
                  ),
                ),

                // User info
                if (state.user != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).closeDrawer();
                            // Navigate to profile
                            context.router.push(const ProfileRoute());
                          },
                          child: avatar(state.user!.name, radius: 70),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.user!.name,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Text(
                            state.user!.email,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),

                        // Logout
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).closeDrawer();
                            // Navigate to login and clear stack
                            context.router.replaceAll([SplashRoute()]);
                          },
                          child: Row(
                            spacing: 6,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Se deconnecter',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Assets.svgs.logOut.svg(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _drawerItem({
    required SvgGenImage icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20),
      leading: icon.svg(height: 30, width: 30),
      title: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87.withAlpha(165),
        ),
      ),
      onTap: onTap,
    );
  }
}
