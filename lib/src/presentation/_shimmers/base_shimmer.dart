import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Global shimmer configuration + primitives.
/// Reuse across all skeleton placeholders for consistent look.
class AppShimmer extends StatelessWidget {
  final Widget child;
  final Duration period;
  final double intensity; // 0..1 influences highlight strength
  final bool enabled;
  const AppShimmer({
    super.key,
    required this.child,
    this.period = const Duration(milliseconds: 1600),
    this.intensity = .35,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    final base = Colors.grey.shade300.withValues(alpha: 0.9);
    final hi = Color.lerp(base, Colors.white, 0.55 + (intensity * 0.25))!;

    return Shimmer(
      period: period,
      gradient: LinearGradient(
        colors: [base, base, hi, base, base],
        stops: const [0, .35, .5, .65, 1],
      ),
      child: child,
    );
  }
}

/// Primitive bar used for skeleton shapes.
class ShimmerBar extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final double opacity;
  const ShimmerBar({
    super.key,
    required this.width,
    required this.height,
    this.radius = 6,
    this.opacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withValues(alpha: .85 * opacity),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class ShimmerCircle extends StatelessWidget {
  final double size;
  final double opacity;
  const ShimmerCircle({super.key, required this.size, this.opacity = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withValues(alpha: .85 * opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Ghost text overlay (faint real text over a bar)
class GhostText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double opacity;
  final TextAlign? align;
  final int maxLines;
  const GhostText({
    super.key,
    required this.text,
    this.fontSize = 11,
    this.fontWeight = FontWeight.w600,
    this.opacity = 0.12,
    this.align,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.fade,
        softWrap: false,
        textAlign: align,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black,
          letterSpacing: .2,
        ),
      ),
    );
  }
}

/// Generic sliver list for shimmer items
class ShimmerSliverList extends StatelessWidget {
  final int count;
  final EdgeInsets itemSpacing;
  final Widget Function(int) builder;
  const ShimmerSliverList({
    super.key,
    required this.count,
    required this.builder,
    this.itemSpacing = const EdgeInsets.only(bottom: 10),
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(
          count,
          (i) => Padding(padding: itemSpacing, child: builder(i)),
        ),
      ),
    );
  }
}
