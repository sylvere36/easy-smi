import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/splash/splash_bloc.dart';
import 'widgets/splash_body_widget.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({super.key, this.withDeepLink, this.fromLogout});
  final bool? withDeepLink;
  final bool? fromLogout;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _navigated = false;
  @override
  void initState() {
    super.initState();
    // Ensure StartLoading is dispatched after the page is built so
    // we don't miss the Loaded state when hot/app restarting.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<SplashBloc>();
      // Always (re)start loading when entering Splash, including after login
      // when we navigate back to Splash to recompute the initial route.
      bloc.add(const StartLoading());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async {
          if (state is Loaded) {
            if (_navigated) return;
            _navigated = true;
            log('Splash: Navigating to ${state.route}');
            // Use root router and replaceAll to ensure navigation always occurs
            // from the splash as the initial route. Defer to next frame.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              log('Splash after mounted: Navigating to ${state.route}');
              context.router.replaceAll([state.route]);
            });
          }
        },
        child: const SplashBodyWidget(),
      ),
    );
  }
}
