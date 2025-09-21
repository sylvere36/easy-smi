import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class AuditControlObjectifPage extends StatelessWidget {
  static const String routeName = '/audit-control-objectif';
  const AuditControlObjectifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'AUDIT',
      paddingHorizontale: 0,
      body: PointControlBody(),
    );
  }
}

// ====== BODY UNIQUEMENT ======
class PointControlBody extends StatefulWidget {
  const PointControlBody({super.key});

  @override
  State<PointControlBody> createState() => _PointControlBodyState();
}

class _PointControlBodyState extends State<PointControlBody> {
  final _formKey = GlobalKey<FormState>();
  final _titreCtrl = TextEditingController();
  final _objCtrl = TextEditingController();
  final _concCtrl = TextEditingController();

  final List<String> _statuts = const [
    'Conforme',
    'Non Conforme',
    'Observation',
  ];
  String? _statut;
  String? _mediaName;

  final Color _blue = const Color(0xFF1565D8);
  InputDecoration _dec(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.poppins(color: const Color(0xFFB5BAC7)),
    filled: true,
    fillColor: const Color(0xFFF5F8FC),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 26),
          children: [
            Text(
              'Point de control et Objectif',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFF0E4342),
                fontSize: 25,
                fontWeight: FontWeight.w600,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 24),

            // ---- Titre
            Text(
              'Titre',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA0AE),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titreCtrl,
              style: GoogleFonts.poppins(),
              decoration: _dec('Titre du point de control'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Obligatoire' : null,
            ),
            const SizedBox(height: 18),

            // ---- Objectif
            Text(
              'Objectif',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA0AE),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _objCtrl,
              minLines: 4,
              maxLines: 6,
              style: GoogleFonts.poppins(),
              decoration: _dec('Objectif du point de control'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Obligatoire' : null,
            ),
            const SizedBox(height: 18),

            // ---- Statut
            Text(
              'Statut',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA0AE),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _statut,
              items: _statuts
                  .map(
                    (s) => DropdownMenuItem(
                      value: s,
                      child: Text(s, style: GoogleFonts.poppins()),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _statut = v),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              dropdownColor: Colors.white,
              decoration: _dec('Selectionnez'),
              validator: (v) => v == null ? 'Choisissez un statut' : null,
            ),
            const SizedBox(height: 18),

            // ---- Media
            Text(
              'Media',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA0AE),
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _pickMedia(context),
              child: InputDecorator(
                decoration: _dec('Selectionnez media').copyWith(
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                ),
                child: Text(
                  _mediaName ?? ' ',
                  style: GoogleFonts.poppins(
                    color: _mediaName == null
                        ? const Color(0x00000000)
                        : Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // ---- Conclusion
            Text(
              'Conclusion',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA0AE),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _concCtrl,
              minLines: 4,
              maxLines: 6,
              style: GoogleFonts.poppins(),
              decoration: _dec('Conclusion'),
            ),
            const SizedBox(height: 28),

            // ---- Bouton
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ajouté ✅  • Statut: $_statut  • Media: ${_mediaName ?? "aucun"}',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    );
                    context.pop();
                  }
                },
                child: Text(
                  'Ajouter',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Sélecteur media (feuille du bas)
  Future<void> _pickMedia(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 12),
            _mediaTile(
              Icons.camera_alt_rounded,
              'Prendre une photo',
              'photo_${DateTime.now().millisecondsSinceEpoch}.jpg',
            ),
            _mediaTile(
              Icons.photo_library_rounded,
              'Choisir depuis la galerie',
              'image_galerie.jpg',
            ),
            _mediaTile(
              Icons.description_rounded,
              'Choisir un document',
              'document_de_presentation.pdf',
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _mediaTile(IconData icon, String label, String chosenName) {
    return ListTile(
      leading: Icon(icon, color: _blue),
      title: Text(label, style: GoogleFonts.poppins()),
      onTap: () {
        setState(() => _mediaName = chosenName);
        Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    _titreCtrl.dispose();
    _objCtrl.dispose();
    _concCtrl.dispose();
    super.dispose();
  }
}
