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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<SplashBloc>();
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              context.router.replaceAll([state.route]);
            });
          }
        },
        child: const SplashBodyWidget(),
      ),
    );
  }
}
