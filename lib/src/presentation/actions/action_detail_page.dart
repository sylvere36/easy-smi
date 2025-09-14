import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ActionDetailPage extends StatelessWidget {
  static const String routeName = '/action-detail';
  const ActionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'ACTION',
      paddingHorizontale: 0,
      body: ActionDetailBody(),
    );
  }
}

/// Colors used across the screen (tuned to match the mock)
class _P {
  static const blue = AppColors.primary;
  static const dark = Color(0xFF111827);
  // static const text = Color(0xFF222B33);
  static const sub = Color(0xFF6B7280);
  static const chipGreen = Color(0xFF16C067);
  static const chipRed = Color(0xFFE94C4C);
  // static const card = Color(0xFFF7F8FB);
  static const divider = Color(0xFFE7EAF0);
  static const field = Color(0xFFF2F5F8);
  static const badge = Color(0xFFEFF2FF);
  // static const headerPill = Color(0xFFEFF2FF);
}

/// ====== ACTION DETAIL BODY (main screen content only) ======
class ActionDetailBody extends StatefulWidget {
  const ActionDetailBody({super.key});

  @override
  State<ActionDetailBody> createState() => _ActionDetailBodyState();
}

class _ActionDetailBodyState extends State<ActionDetailBody> {
  final TextEditingController _commentCtrl = TextEditingController();

  final List<_Todo> _todos = [
    _Todo(
      'Finalisation de la procédure de validation qualité des offres commerciales',
      dueLabel: 'Aujourd’hui',
      state: _TodoState.today,
    ),
    _Todo(
      'Finalisation de la procédure de validation qualité des offres commerciales',
      dueLabel: 'Hier',
      state: _TodoState.late,
    ),
    _Todo(
      'Finalisation de la procédure de validation qualité des offres commerciales',
      dueLabel: 'Il y a 1 semaine',
      state: _TodoState.ago,
    ),
    _Todo(
      'Finalisation de la procédure de validation qualité des offres commerciales',
      crossed: true,
      dueLabel: '04/08/25',
    ),
  ];

  void _openReportSheet() => _openBottomSheet(
    context,
    title: 'Rapport',
    firstLabel: 'Conclusion',
    onSubmit: () => Navigator.pop(context),
  );

  void _openAddPlanningSheet() => _openBottomSheet(
    context,
    title: 'Ajouter',
    firstLabel: 'Operationnalisation / Planning',
    onSubmit: () => Navigator.pop(context),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          // Title block
          _titleBlock(),

          // Composer + attachments icon
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              children: [
                Expanded(
                  child: _roundedField(
                    child: TextField(
                      controller: _commentCtrl,
                      decoration: InputDecoration(
                        hintText: 'Ecrire  un commentaire',
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(color: _P.sub),
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _roundIcon(
                    Icons.attach_file_rounded,
                    onTap: () {}, // TODO: pick file
                  ),
                ),
              ],
            ),
          ),

          // Comments header + tiny list
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              children: [
                Text(
                  'Commentaire(s)',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _tinyCounter(2),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    context.router.push(const CommentsRoute());
                  },
                  child: Text(
                    'Voir tout',
                    style: GoogleFonts.poppins(
                      color: _P.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _commentLine(
            'Beatrice BOSSOU',
            'Il y a 30 min',
            'Les documents fournies ne respectent par les normes internationnales',
          ),
          _commentLine(
            'Beatrice BOSSOU',
            'Il y a 30 min',
            'Les documents fournies ne respectent par les normes internationnales',
          ),

          // Section: Operationnalisation / Planning
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: _sectionCard(
              title: 'Operationnalisation / Planning',
              onAdd: _openAddPlanningSheet,
              trailing: _pillButton(
                'Ajouter',
                icon: Icons.add,
                onTap: _openAddPlanningSheet,
              ),
              child: Column(
                children: _todos
                    .asMap()
                    .entries
                    .map(
                      (e) => _todoTile(
                        e.value,
                        hasFile: e.value.state == _TodoState.today,
                        onToggle: () =>
                            setState(() => e.value.crossed = !e.value.crossed),
                        onEdit: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          // Section: Détail de l’action
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: _sectionCard(
              title: 'Detail de l’action',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      _labelValue('Type action', const SizedBox()),
                      _chip('Corrective', _P.chipGreen),
                    ],
                  ),
                  _line(),
                  _labelValue(
                    'Processus concerné',
                    Text(
                      'Marketing internationallonnal et developpement des ventes regionnales',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ),
                  _line(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _labelValue(
                            'Justifications de l’action',
                            const SizedBox(),
                          ),
                          _chip('Écart', _P.chipRed),
                        ],
                      ),

                      Text(
                        'Risque d’incohérences commerciales dans les offres à l’international, Absence de validation systématique des fiches produits Offres avant diffusion./',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),

                  _line(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _labelValue('Origine', const SizedBox()),
                          Text(
                            'Enjeux',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "L'Arrivée de l'Intelligence Artificielle dans le Monde : Des Implications Profondes et des Défis Complexes Selon Elon Musk",
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Section: Rapports
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: _sectionCard(
              title: 'Rapports',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _labelValue('Date :', const SizedBox()),
                      Text(
                        '12 Août 2025',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _labelValue(
                      'Conclusion',
                      Text(
                        'Finalisation de la procédure de validation qualité des offres commerciales Finalisation de la procédure de validation qualité des offres commercialesFinalisation de la procédure de validation qualité des offres commercialesFinalisation de la procédure de validation qualité des offres commerciales',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Divider(color: _P.divider, height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Piece jointe',
                      style: GoogleFonts.poppins(color: _P.sub),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Assets.svgs.pdf.svg(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'FicheDeNote.pdf',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        _primaryButton('Terminer', onTap: _openReportSheet),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title lines (with the light highlight)
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE7F0FF),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              'Renforcement du contrôle qualité dans le departement gestion produits',

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Row(
            children: [
              _meta('Date', '12-03-25'),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: _meta('Ref :', 'AZE-ABA-AUA'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: _meta('Ver :', '01'),
              ),
              const Spacer(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_primaryButton('Terminer', onTap: _openReportSheet)],
        ),
      ],
    );
  }
}

/* --------------------- helpers & sub-widgets --------------------- */

Widget _meta(String k, String v) => RichText(
  text: TextSpan(
    style: GoogleFonts.poppins(color: _P.sub, fontSize: 13),
    children: [
      TextSpan(text: '$k '),
      TextSpan(
        text: v,
        style: const TextStyle(color: _P.dark, fontWeight: FontWeight.w700),
      ),
    ],
  ),
);

Widget _roundedField({required Widget child}) => Container(
  decoration: BoxDecoration(
    color: _P.field,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0xFFE5EAF0)),
  ),
  child: child,
);

Widget _roundIcon(
  IconData ic, {
  Color bg = const Color(0xFFEFF2FF),
  Color icColor = _P.dark,
  VoidCallback? onTap,
}) => Material(
  color: bg,
  shape: const CircleBorder(),
  child: InkWell(
    customBorder: const CircleBorder(),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(ic, color: icColor, size: 20),
    ),
  ),
);

Widget _tinyCounter(int n) => Container(
  decoration: BoxDecoration(
    color: _P.badge,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Text(
      '$n',
      style: GoogleFonts.poppins(
        color: _P.blue,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
    ),
  ),
);

Widget _commentLine(String name, String time, String text) => Padding(
  padding: const EdgeInsets.only(bottom: 12),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _avatar(name),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.poppins(color: _P.sub, fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(text, style: GoogleFonts.poppins()),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

// Widget _commentRow(_Msg m) => Padding(
//   padding: const EdgeInsets.only(bottom: 18),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       _avatar(m.author),
//       Expanded(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       m.author,
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Text(m.time, style: GoogleFonts.poppins(color: _P.sub)),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 6),
//                 child: Text(m.text, style: GoogleFonts.poppins(fontSize: 16)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// );

Widget _avatar(String name) {
  final parts = name.split(' ');
  final initials =
      (parts.isNotEmpty ? parts.first.characters.first : '') +
      (parts.length > 1 ? parts.last.characters.first : '');
  return CircleAvatar(
    radius: 20,
    backgroundColor: const Color(0xFF1DBA9F),
    child: Text(
      initials.toUpperCase(),
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget _sectionCard({
  required String title,
  Widget? trailing,
  VoidCallback? onAdd,
  required Widget child,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
      ],
      border: Border.all(color: _P.divider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF3F5FF),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Row(
              children: [
                Assets.svgs.jamBlue.svg(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
          child: child,
        ),
      ],
    ),
  );
}

Widget _pillButton(
  String label, {
  IconData? icon,
  required VoidCallback onTap,
}) => Material(
  color: Colors.transparent,
  shape: const StadiumBorder(side: BorderSide()),
  child: InkWell(
    onTap: onTap,
    customBorder: const StadiumBorder(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 16),
          if (icon != null) const Padding(padding: EdgeInsets.only(left: 6)),
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        ],
      ),
    ),
  ),
);

Widget _primaryButton(String label, {required VoidCallback onTap}) => Material(
  color: _P.blue,
  borderRadius: BorderRadius.circular(8),
  child: InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  ),
);

Widget _chip(String text, Color color) => Container(
  decoration: BoxDecoration(
    color: color.withOpacity(.12),
    borderRadius: BorderRadius.circular(6),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w800,
        fontSize: 12,
      ),
    ),
  ),
);

Widget _labelValue(String label, Widget value) => Padding(
  padding: const EdgeInsets.only(bottom: 12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: GoogleFonts.poppins(color: _P.sub)),
      value,
    ],
  ),
);

Widget _line() => const Padding(
  padding: EdgeInsets.only(top: 12, bottom: 12),
  child: Divider(color: _P.divider, height: 1),
);

Widget _todoTile(
  _Todo t, {
  required VoidCallback onToggle,
  required VoidCallback onEdit,
  bool hasFile = false,
}) {
  final Color dueColor = switch (t.state) {
    _TodoState.today => _P.chipGreen,
    _TodoState.late => _P.chipRed,
    _ => _P.sub,
  };

  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: InkWell(
              onTap: onToggle,
              child: Icon(
                t.crossed
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: t.crossed ? _P.blue : _P.sub,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.title,
                    style: GoogleFonts.poppins(
                      decoration: t.crossed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: _P.dark,
                      decorationThickness: 2,
                    ),
                  ),
                  if (t.dueLabel != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          Text(
                            t.dueLabel!,
                            style: GoogleFonts.poppins(
                              color: dueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          if (hasFile)
                            const Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Icon(
                                Icons.attach_file_rounded,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Divider(color: _P.divider, height: 1),
      ),
    ],
  );
}

/// ====== BOTTOM SHEETS (Rapport / Ajouter) ======

Future<void> _openBottomSheet(
  BuildContext context, {
  required String title,
  required String firstLabel,
  required VoidCallback onSubmit,
}) {
  final textCtrl = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (ctx) {
      final bottom = MediaQuery.of(ctx).viewInsets.bottom;
      String pieceJointe = 'Selectionez media';
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header with close
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: const Color(0xFF0E3C42),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          padding: const EdgeInsets.all(4),

                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close_rounded, size: 20),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      firstLabel,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _roundedField(
                      child: TextField(
                        controller: textCtrl,
                        minLines: 5,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: 'Ecrire',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      'Media',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {
                        FilePicker.platform
                            .pickFiles(
                              allowedExtensions: [
                                'jpg',
                                'jpeg',
                                'png',
                                'pdf',
                                'doc',
                                'docx',
                              ],
                              type: FileType.custom,
                            )
                            .then((result) {
                              if (result != null && result.files.isNotEmpty) {
                                setState(() {
                                  pieceJointe = result.files.first.name;
                                });
                              }
                            });
                      },
                      child: _roundedField(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.attach_file_rounded,
                                color: _P.dark,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                pieceJointe,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: _P.sub,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _primaryButton('Terminer', onTap: onSubmit),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

/* --------------------- models --------------------- */

class _Todo {
  final String title;
  String? dueLabel;
  bool crossed;
  _TodoState state;
  _Todo(
    this.title, {
    this.dueLabel,
    this.crossed = false,
    this.state = _TodoState.none,
  });
}

enum _TodoState { none, today, late, ago }
