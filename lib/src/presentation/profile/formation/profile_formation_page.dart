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
class ProfileFormationPage extends StatelessWidget {
  static const String routeName = '/profile-formation';
  const ProfileFormationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'FORMATION',
      paddingHorizontale: 0,
      body: _FormationReportBody(),
    );
  }
}

class _FormationReportBody extends StatefulWidget {
  const _FormationReportBody();

  @override
  State<_FormationReportBody> createState() => _FormationReportBodyState();
}

class _FormationReportBodyState extends State<_FormationReportBody> {
  // UI palette
  final Color kBlue = AppColors.primary; // action button + header accent
  final Color kFieldFill = const Color(0xFFF7F8FA);
  final Color kStroke = const Color(0xFFE7E9EE);
  final Color kLabel = const Color(0xFF0E1117);
  final Color kHint = const Color(0xFF7B8089);
  final BorderRadius kRadius = BorderRadius.circular(12);

  // Form state
  String? _formation;
  String? _resultat;
  String _pieceJointe = 'Piece jointe';
  DateTime? _obtention = DateTime(2025, 10, 09);
  DateTime? _expiration = DateTime(2025, 11, 09);

  // Data sources
  final List<String> _formations = const [
    'ISO 9001 & ISO 45001',
    'Management Qualité',
    'Comptabilité',
    'Sécurité au travail',
  ];

  final List<String> _resultats = const ['Validé', 'Non validé', 'En attente'];

  // Helpers
  Future<void> _pickFromSheet({
    required List<String> options,
    required ValueChanged<String> onPicked,
    String title = 'Sélectionnez',
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E5EA),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            for (final o in options)
              InkWell(
                onTap: () {
                  onPicked(o);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(o, style: GoogleFonts.poppins(fontSize: 15)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    setState(() {});
  }

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
                        'Rapport de formation',
                        style: GoogleFonts.mulish(
                          color: const Color(0xFF053742),
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                  // -------- Formation -----------
                  _label('Formation'),
                  _DropdownField(
                    label: _formation ?? 'Selectionnez la formation',
                    hintColor: _formation == null ? kHint : kLabel,
                    radius: kRadius,
                    fill: kFieldFill,
                    stroke: kStroke,
                    onTap: () {
                      setState(() {
                        _formation = _formations[Random.secure().nextInt(4)];
                      });
                      context.router.push(const ProfileSearchFormationRoute());
                    },
                  ),

                  // -------- Attestation -----------
                  _label('Attestation de formation', top: 22),
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
                  _label('Date', top: 22),
                  Row(
                    spacing: 14,
                    children: [
                      Expanded(
                        child: _DateField(
                          label: 'Obtention',
                          value: _fmt(_obtention),
                          onCalendarTap: () => _pickDate(
                            initial: _obtention ?? DateTime.now(),
                            onPicked: (d) => _obtention = d,
                          ),
                          radius: kRadius,
                          fill: kFieldFill,
                          stroke: kStroke,
                        ),
                      ),
                      Expanded(
                        child: _DateField(
                          label: 'Expiration',
                          value: _fmt(_expiration),
                          onCalendarTap: () => _pickDate(
                            initial: _expiration ?? DateTime.now(),
                            onPicked: (d) => _expiration = d,
                          ),
                          radius: kRadius,
                          fill: kFieldFill,
                          stroke: kStroke,
                        ),
                      ),
                    ],
                  ),

                  // -------- Résultat -----------
                  _label('Resultat de l’evaluation', top: 22),
                  _DropdownField(
                    label: _resultat ?? 'Selectionnez le resultat',
                    hintColor: _resultat == null ? kHint : kLabel,
                    radius: kRadius,
                    fill: kFieldFill,
                    stroke: kStroke,
                    onTap: () => _pickFromSheet(
                      options: _resultats,
                      title: 'Résultat',
                      onPicked: (v) => _resultat = v,
                    ),
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
                        color: kBlue.withOpacity(.18),
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
  final String label;
  final String value;
  final VoidCallback onCalendarTap;
  final BorderRadius radius;
  final Color fill;
  final Color stroke;

  const _DateField({
    required this.label,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              color: const Color(0xFF6B7078),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
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
                child: Text(
                  value,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF3A3F45),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
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
