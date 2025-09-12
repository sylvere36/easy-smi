import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class BadgeIcon extends StatelessWidget {
  final bool hasNotification;
  final VoidCallback? onTap;
  final SvgGenImage icon;

  const BadgeIcon({
    super.key,
    required this.hasNotification,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Icon
          icon.svg(),

          // Point rouge
          if (hasNotification)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
