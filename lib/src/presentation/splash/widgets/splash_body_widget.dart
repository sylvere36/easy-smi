import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/loading_widget.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icon.icon.image(),
              const LoadingWidget(color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}
