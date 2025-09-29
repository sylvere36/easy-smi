import 'package:flutter/material.dart';

import 'base_shimmer.dart';

/// Shimmer placeholder replicating the layout of an ActionCard using base primitives.
class CardShimmer extends StatelessWidget {
  final bool compact;
  final double intensity; // 0..1 highlight strength
  final bool square;
  final bool ghostHints; // show faint unreadable text/icon silhouettes
  const CardShimmer({
    super.key,
    this.compact = false,
    this.intensity = .45,
    this.square = false,
    this.ghostHints = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      intensity: intensity,
      child: _CardSkeleton(
        compact: compact,
        square: square,
        intensity: intensity,
        ghostHints: ghostHints,
      ),
    );
  }
}

class _CardSkeleton extends StatelessWidget {
  final bool compact;
  final bool square;
  final double intensity;
  final bool ghostHints;
  const _CardSkeleton({
    required this.compact,
    required this.square,
    required this.intensity,
    required this.ghostHints,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: badge text ghost + icon bubble ghost
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ShimmerBar(
                        width: 140,
                        height: 12,
                        radius: square ? 0 : 4,
                      ),
                      if (ghostHints)
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GhostText(
                              text: 'En retard · il y a 1...',
                              fontSize: 10,
                              opacity: .14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const ShimmerCircle(size: 22),
                    if (ghostHints)
                      Opacity(
                        opacity: 0.14 + intensity * 0.1,
                        child: const Icon(
                          Icons.chat_bubble_outline,
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title main line
            Stack(
              children: [
                ShimmerBar(
                  width: double.infinity,
                  height: 14,
                  radius: square ? 0 : 6,
                ),
                if (ghostHints)
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GhostText(
                        text: 'Renforcement du control qualité ...',
                        fontWeight: FontWeight.w700,
                        opacity: .13,
                      ),
                    ),
                  ),
              ],
            ),
            if (!compact) ...[
              const SizedBox(height: 8),
              Stack(
                children: [
                  ShimmerBar(
                    width: MediaQuery.of(context).size.width * .55,
                    height: 14,
                    radius: square ? 0 : 6,
                  ),
                  if (ghostHints)
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GhostText(
                          text: 'Renforcement du control...',
                          opacity: .11,
                        ),
                      ),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            // Bottom status + owner ghost
            Row(
              children: [
                Stack(
                  children: [
                    ShimmerBar(width: 70, height: 12, radius: square ? 0 : 4),
                    if (ghostHints)
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GhostText(
                            text: 'En cours',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            opacity: .14,
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    ShimmerBar(width: 90, height: 12, radius: square ? 0 : 4),
                    if (ghostHints)
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GhostText(
                            text: 'Responsable',
                            fontSize: 10,
                            opacity: .13,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Convenience vertical list of shimmering action cards
class CardShimmerList extends StatelessWidget {
  final int count;
  final bool compact;
  final double intensity;
  const CardShimmerList({
    super.key,
    this.count = 3,
    this.compact = false,
    this.intensity = .45,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) =>
          CardShimmer(compact: compact, intensity: intensity),
    );
  }
}
