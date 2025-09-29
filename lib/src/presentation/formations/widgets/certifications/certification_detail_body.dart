import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../_commons/route/app_router.gr.dart';
import '../../../_commons/theming/app_color.dart';

class CertificationDetailBody extends StatelessWidget {
  const CertificationDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const blue = AppColors.primary;

    return Column(
      children: [
        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row (thumbnail + title)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // illustration
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1E6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Assets.images.quizz.image(),
                    ),
                    const SizedBox(width: 16),
                    // title
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Orientation client – au cœur de la confiance',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // "Certification" + badge
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Certification',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.verified_outlined,
                                color: blue,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Meta: last update + language
                const Row(
                  children: [
                    _MetaBlock(label: 'Dernière mise à jour', value: '04/2025'),
                    SizedBox(width: 24),
                    _MetaBlock(
                      label: 'Langue',
                      value: 'Francais',
                      icon: Icons.language,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Rating
                Row(
                  children: [
                    const _StarRow(rating: 4.3),
                    const SizedBox(width: 12),
                    Text(
                      '4,3',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Detail title
                Text(
                  'Detail',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),

                // Long description
                Text(
                  'Capacité à comprendre les besoins du client, à adapter sa communication et à proposer des solutions personnalisées.  '
                  'Capacité à comprendre les besoins du client, à adapter sa communication et à proposer des solutions personnalisées.',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
                const SizedBox(height: 24),

                // Comment input
                _CommentInput(hint: 'Ecrire  un commentaire', onAttach: () {}),
                const SizedBox(height: 20),

                // Comments header
                Row(
                  children: [
                    Text(
                      'Commentaire(s)',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const _CounterChip(count: 2),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.router.push(
                          CommentsRoute(
                            commentableType: 'Certification',
                            commentableId: '0',
                          ),
                        );
                      },
                      child: Text(
                        'Voir tout',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Comments list (samples)
                const _CommentTile(
                  initials: 'MH',
                  name: 'Beatrice BOSSOU',
                  timeAgo: 'Il y a 30 min',
                  text:
                      'Les documents fournies ne respectent par les normes internationnales',
                ),
                const SizedBox(height: 16),
                const _CommentTile(
                  initials: 'MH',
                  name: 'Beatrice BOSSOU',
                  timeAgo: 'Il y a 30 min',
                  text:
                      'Les documents fournies ne respectent par les normes internationnales',
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),

        // Bottom primary button
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                context.router.push(const QuizzRoute());
              },
              child: Text(
                'OUVRIR',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: .2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* ---------- widgets ---------- */

class _MetaBlock extends StatelessWidget {
  const _MetaBlock({required this.label, required this.value, this.icon});

  final String label;
  final String value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: Colors.grey),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _StarRow extends StatelessWidget {
  const _StarRow({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= .5;

    final List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      IconData data;
      if (i < full) {
        data = Icons.star_rounded;
      } else if (i == full && hasHalf) {
        data = Icons.star_half_rounded;
      } else {
        data = Icons.star_border_rounded;
      }
      stars.add(Icon(data, color: const Color(0xFFFFB300), size: 22));
    }
    return Row(children: stars);
  }
}

class _CommentInput extends StatelessWidget {
  const _CommentInput({required this.hint, required this.onAttach});

  final String hint;
  final VoidCallback onAttach;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          CommentsRoute(commentableType: 'Certification', commentableId: '0'),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F6FA),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: hint,
                  fillColor: const Color(0xFFF3F6FA),
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.inter(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: GoogleFonts.inter(fontSize: 16),
              ),
            ),
            IconButton(
              onPressed: onAttach,
              icon: const Icon(Icons.attach_file, size: 22),
              color: Colors.black87,
              splashRadius: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterChip extends StatelessWidget {
  const _CounterChip({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$count',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  const _CommentTile({
    required this.initials,
    required this.name,
    required this.timeAgo,
    required this.text,
  });

  final String initials;
  final String name;
  final String timeAgo;
  final String text;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // avatar
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xFF2E8B57),
          child: Text(
            initials,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name + time
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: onSurface,
                      ),
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(text, style: GoogleFonts.inter(fontSize: 15, height: 1.45)),
            ],
          ),
        ),
      ],
    );
  }
}
