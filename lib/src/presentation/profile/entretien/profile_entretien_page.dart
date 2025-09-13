import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ProfileEntretienPage extends StatelessWidget {
  static const String routeName = '/profile-entretien';
  const ProfileEntretienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'ENTRETIEN',
      paddingHorizontale: 0,
      body: _EntretienProofBody(),
    );
  }
}

class _EntretienProofBody extends StatefulWidget {
  const _EntretienProofBody();

  @override
  State<_EntretienProofBody> createState() =>
      _EntretienProofBodyState();
}

class _EntretienProofBodyState extends State<_EntretienProofBody> {
  // UI palette
  final Color kBlue = AppColors.primary; // action button + header accent
  final Color kFieldFill = const Color(0xFFF7F8FA);
  final Color kStroke = const Color(0xFFE7E9EE);
  final Color kLabel = const Color(0xFF0E1117);
  final Color kHint = const Color(0xFF7B8089);
  final BorderRadius kRadius = BorderRadius.circular(12);

  // Form state
  String? _entretien;
  String _pieceJointe = 'Piece jointe';
  DateTime? _participation = DateTime(2025, 10, 09);

  // Data sources (entretien list)
  final List<String> _entretiens = const [
    'Entretien A',
    'Entretien B',
    'Entretien C',
    'Entretien D',
  ];

  Future<void> _pickDate({
    required DateTime initial,
    required ValueChanged<DateTime> onPicked,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 10),
      helpText: 'Sélectionnez la date',
      confirmText: 'OK',
      cancelText: 'Annuler',
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: kBlue)),
          child: child!,
        );
      },
    );
    if (picked != null) onPicked(picked);
    setState(() {});
  }

  String _fmt(DateTime? d) => d == null
      ? ''
      : "${d.day.toString().padLeft(2, '0')}-${d.month.toString().padLeft(2, '0')}-${d.year}";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          // scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Center(
                      child: Text(
                        "Rapport d'entretien",
                        style: GoogleFonts.mulish(
                          color: const Color(0xFF053742),
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                  // -------- Formation -----------
                  _label('Competence à valider'),
                  _DropdownField(
                    label: _entretien ?? 'Selectionnez la compétence',
                    hintColor: _entretien == null ? kHint : kLabel,
                    radius: kRadius,
                    fill: kFieldFill,
                    stroke: kStroke,
                    onTap: () {
                      setState(() {
                        _entretien =
                            _entretiens[Random.secure().nextInt(4)];
                      });
                      context.router.push(
                        const ProfileSearchEntretienRoute(),
                      );
                    },
                  ),

                  // -------- Attestation -----------
                  _label('Rapport', top: 22),
                  _AttachmentField(
                    text: _pieceJointe,
                    onTapChevron: () {
                      // Pick one file (image or doc) on local datafile
                      // use file_picker package
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
                                _pieceJointe = result.files.first.name;
                              });
                            }
                          });
                    },
                    radius: kRadius,
                    fill: kFieldFill,
                    stroke: kStroke,
                  ),

                  // -------- Date (two columns) -----------
                  _label('Date de l\'entretien', top: 22),
                  _DateField(
                    value: _fmt(_participation),
                    onCalendarTap: () => _pickDate(
                      initial: _participation ?? DateTime.now(),
                      onPicked: (d) => _participation = d,
                    ),
                    radius: kRadius,
                    fill: kFieldFill,
                    stroke: kStroke,
                  ),

                  // bottom padding so the button does not cover fields
                  const Padding(padding: EdgeInsets.only(bottom: 16)),
                ],
              ),
            ),
          ),

          // Submit button
          Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 24, 18),
              child: GestureDetector(
                onTap: () {
                  context.router.pop();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Soumis')));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: kBlue.withAlpha(118),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        'SOUMETTRE',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // section label
  Widget _label(String text, {double top = 8}) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.mulish(
          color: kLabel,
          fontWeight: FontWeight.w600,
          fontSize: 21,
        ),
      ),
    );
  }
}

/* =====================  Reusable fields  ===================== */

class _DropdownField extends StatelessWidget {
  final String label;
  final Color hintColor;
  final BorderRadius radius;
  final Color fill;
  final Color stroke;
  final VoidCallback onTap;

  const _DropdownField({
    required this.label,
    required this.hintColor,
    required this.radius,
    required this.fill,
    required this.stroke,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        decoration: BoxDecoration(
          color: fill,
          borderRadius: radius,
          border: Border.all(color: stroke),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 12, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                    color: hintColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: stroke),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF3A3F45),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttachmentField extends StatelessWidget {
  final String text;
  final VoidCallback onTapChevron;
  final BorderRadius radius;
  final Color fill;
  final Color stroke;

  const _AttachmentField({
    required this.text,
    required this.onTapChevron,
    required this.radius,
    required this.fill,
    required this.stroke,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: radius,
        border: Border.all(color: stroke),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 12, 10),
        child: Row(
          children: [
            const Icon(Icons.attachment_rounded, color: Color(0xFF3A3F45)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF3A3F45),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: onTapChevron,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: stroke),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF3A3F45),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String value;
  final VoidCallback onCalendarTap;
  final BorderRadius radius;
  final Color fill;
  final Color stroke;

  const _DateField({
    required this.value,
    required this.onCalendarTap,
    required this.radius,
    required this.fill,
    required this.stroke,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: fill,
                border: Border.all(color: stroke),
                borderRadius: radius,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 12, 60, 12),
                child: Row(
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF3A3F45),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 6,
              bottom: 6,
              child: InkWell(
                onTap: onCalendarTap,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: stroke),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Assets.svgs.calendarDate.svg(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
