import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injection_container.dart' as ic;
import 'src/infrastructure/_commons/network/env_config.dart';
import 'src/presentation/_commons/theming/app_color.dart';
import 'src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await EnvManager().init(env: Environment.dev);
  ic.init();

  // Status Bar Style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}
