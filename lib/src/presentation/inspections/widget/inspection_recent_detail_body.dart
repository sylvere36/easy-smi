import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';

class InspectionRecentDetailBody extends StatelessWidget {
  const InspectionRecentDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final comments = const [
      _Comment(
        initials: 'MH',
        name: 'Beatrice BOSSOU',
        ago: 'Il y a 30 min',
        text:
            'Les documents fournies ne respectent par les normes internationnales',
      ),
      _Comment(
        initials: 'MH',
        name: 'Beatrice BOSSOU',
        ago: 'Il y a 30 min',
        text:
            'Les documents fournies ne respectent par les normes internationnales',
      ),
    ];

    final history = const [
      _History(
        status: _HistoryStatus.nonConforme,
        title:
            'Finalisation de la procédure de validation qualité des offres commerciales',
        date: '30 /08 / 25',
      ),
      _History(
        status: _HistoryStatus.conforme,
        title:
            'Finalisation de la procédure de validation qualité des offres commerciales',
        date: '23 /05 / 24',
      ),
      _History(
        status: _HistoryStatus.nonConforme,
        title:
            'Finalisation de la procédure de validation qualité des offres commerciales',
        date: '30 /08 / 25',
      ),
      _History(
        status: _HistoryStatus.nonConforme,
        title:
            'Finalisation de la procédure de validation qualité des offres commerciales',
        date: '30 /08 / 25',
      ),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
      children: [
        // ---- Title chips (deux lignes)
        _titleChip(
          'Inspections sur les activités internes liées aux dechargements des marchandises',
        ),

        // ---- Meta + Demarrer
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Wrap(
                spacing: 14,
                runSpacing: 6,
                children: [
                  _Meta(label: 'Date', value: '12-03-25'),
                  _Meta(label: 'Ref', value: 'AZE-ABA-AUA'),
                  _Meta(label: 'Ver', value: '01'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(children: [const Spacer(), _startButton()]),
              ),
            ],
          ),
        ),

        // ---- Input comment
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: GestureDetector(
            onTap: () {
              context.router.push(
                CommentsRoute(
                  commentableType: 'Inspection',
                  commentableId: '0',
                ),
              );
            },
            child: Container(
              decoration: _fieldDecoration(),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 14, 10, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ecrire  un commentaire',
                        style: TextStyle(color: Colors.black38, fontSize: 16),
                      ),
                    ),
                    Icon(Icons.attachment_rounded, color: Colors.black54),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ---- Comments header
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Row(
            children: [
              const Text(
                'Commentaire(s)',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4F9),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: Text(
                      '2',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.router.push(
                        CommentsRoute(
                          commentableType: 'Inspection',
                          commentableId: '0',
                        ),
                      );
                    },
                    child: const Text(
                      'Voir tout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ---- Comments list
        ...comments.map(
          (c) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _CommentTile(c: c),
          ),
        ),

        // ---- Historiques section
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // header
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  child: Row(
                    children: [
                      Assets.svgs.jamBlue.svg(),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Historiques',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // list items (fond blanc)
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [...history.map((h) => _HistoryTile(h: h))],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/* ==================== Small atoms ==================== */

Container _titleChip(String text) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFF1F4FB),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          height: 1.2,
        ),
      ),
    ),
  );
}

class _Meta extends StatelessWidget {
  final String label;
  final String value;
  const _Meta({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
        ),
      ],
    );
  }
}

Container _startButton() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1864EA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          Text(
            'DEMARRER',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    ),
  );
}

BoxDecoration _fieldDecoration() => BoxDecoration(
  color: const Color(0xFFF5F8FC),
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: const Color(0xFFE6ECF2)),
);

/* ==================== Comments ==================== */

class _Comment {
  final String initials;
  final String name;
  final String ago;
  final String text;
  const _Comment({
    required this.initials,
    required this.name,
    required this.ago,
    required this.text,
  });
}

class _CommentTile extends StatelessWidget {
  final _Comment c;
  const _CommentTile({required this.c});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _avatar(c.initials),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        c.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      c.ago,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 2),
                  child: Text(
                    c.text,
                    style: const TextStyle(fontSize: 16, height: 1.35),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _avatar(String t) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFF1BB38A),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        t,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}

/* ==================== History ==================== */

enum _HistoryStatus { conforme, nonConforme }

class _History {
  final _HistoryStatus status;
  final String title;
  final String date;
  const _History({
    required this.status,
    required this.title,
    required this.date,
  });
}

class _HistoryTile extends StatelessWidget {
  final _History h;
  const _HistoryTile({required this.h});

  @override
  Widget build(BuildContext context) {
    final isConforme = h.status == _HistoryStatus.conforme;
    final color = isConforme
        ? const Color(0xFF08A87D)
        : const Color(0xFFE9362E);
    final label = isConforme ? 'Conforme' : 'Non conforme';

    return Column(
      children: [
        // row 1: label + date + download
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    h.date,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // row 2: title + icon
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  h.title,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.download_rounded,
                  size: 26,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        // divider
        Container(height: 1, color: const Color(0xFFECECEC)),
      ],
    );
  }
}
