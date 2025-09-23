import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/assets.gen.dart';
import '../../../application/auth/user/authenticated_user_bloc.dart';
import '../../../infrastructure/_commons/network/user_session.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_size.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/my_toast.dart';

@RoutePage()
class PendingJoinOrganisationPage extends StatefulWidget {
  static const routeName = '/pending-join-organisation';
  const PendingJoinOrganisationPage({super.key});

  @override
  State<PendingJoinOrganisationPage> createState() =>
      _PendingJoinOrganisationPageState();
}

class _PendingJoinOrganisationPageState
    extends State<PendingJoinOrganisationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticatedUserBloc, AuthenticatedUserState>(
      listener: (context, state) {
        if (state.user != null && state.user!.organizationValidated) {
          context.router.replaceAll([const HomeRoute()]);
        }

        if (state.user != null && !state.user!.organizationValidated) {
          errorToast(
            context: context,
            msg: 'Votre demande d\'adhésion est en attente de validation.',
          );
        }

        if (state.canLogout == true) {
          context.router.replaceAll([SplashRoute()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: FutureBuilder(
            future: myUserSession.getOrganizationLicense(),
            builder: (context, asyncSnapshot) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icon.icon.image(height: 150, width: 150),
                    // Organisation email
                    if (asyncSnapshot.hasData)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
                        child: Text(
                          'Vous avez demandé à rejoindre l\'organisation associée à l\'email suivant: \n\n'
                          '${asyncSnapshot.data!.adminEmail}',
                          style: TextStyle(
                            fontSize: AppSize.getSize(
                              context: context,
                              mobileValue: 18,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // refresh button
                    const SizedBox(height: 20),
                    if (state.isLoading) const LoadingWidget(),
                    if (!state.isLoading)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthenticatedUserBloc>().add(
                              const AuthenticatedUserEvent.fetchRequested(),
                            );
                          },
                          child: const Text('Actualiser'),
                        ),
                      ),
                    const SizedBox(height: 20),
                    // Logout button
                    if (!state.isLoading)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: OutlinedButton(
                          onPressed: () {
                            context.read<AuthenticatedUserBloc>().add(
                              const AuthenticatedUserEvent.logoutRequested(),
                            );
                          },
                          child: const Text('Se déconnecter'),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
