import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ProgrammAuditPage extends StatelessWidget {
  static const String routeName = '/programm-audit';
  const ProgrammAuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(appBarTitle: 'AUDIT', paddingHorizontale: 0);
  }
}

// ===== BODY UNIQUEMENT =====
class ProgrammerAuditBody extends StatefulWidget {
  const ProgrammerAuditBody({super.key});

  @override
  State<ProgrammerAuditBody> createState() => _ProgrammerAuditBodyState();
}

class _ProgrammerAuditBodyState extends State<ProgrammerAuditBody> {
  final _formKey = GlobalKey<FormState>();
  final _descCtrl = TextEditingController();

  final Color _blue = const Color(0xFF1565D8);
  final List<String> _typesAudit = const ['Interne', 'Externe', 'Fournisseur'];
  final List<String> _processus = const [
    'Marketing international et développement',
    'Gestion produits',
    'Production & Opérations',
    'Achats & Logistique',
  ];
  final List<String> _audites = const [
    'Jean Yves KOSSI PAUL',
    'Maude HALL',
    'Henry DUFOUR',
  ];

  String? _typeAudit;
  String? _processusSel;
  String? _auditeSel;
  DateTime? _dateDebut;
  DateTime? _dateFin;

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

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} - ${d.month.toString().padLeft(2, '0')} - ${d.year.toString().padLeft(4, '0')}';

  Future<void> _pickDate({required bool start}) async {
    final initial = start
        ? (_dateDebut ?? DateTime.now())
        : (_dateFin ?? _dateDebut ?? DateTime.now());
    final first = DateTime(2000);
    final last = DateTime(2100);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
      helpText: start ? 'Date Début' : 'Date Fin',
      cancelText: 'Annuler',
      confirmText: 'OK',
    );
    if (picked != null) {
      setState(() {
        if (start) {
          _dateDebut = picked;
          if (_dateFin != null && _dateFin!.isBefore(_dateDebut!)) {
            _dateFin = _dateDebut;
          }
        } else {
          _dateFin = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 26),
          children: [
            Text(
              'Programmer un audit',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFF0E4342),
                fontSize: 26,
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 28),

            // Description
            Text(
              'Description',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descCtrl,
              minLines: 6,
              maxLines: 8,
              style: GoogleFonts.poppins(),
              decoration: _dec('Description de l’audit'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Obligatoire' : null,
            ),
            const SizedBox(height: 22),

            // Type d'audit
            Text(
              'Type d’audit',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _typeAudit,
              items: _typesAudit
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: GoogleFonts.poppins()),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _typeAudit = v),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: _dec('Selectionnez'),
              validator: (v) => v == null ? 'Choisissez un type' : null,
            ),
            const SizedBox(height: 22),

            // Processus concerné
            Text(
              'Processus concerné',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _processusSel,
              items: _processus
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: GoogleFonts.poppins()),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _processusSel = v),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: _dec('Selectionnez'),
              validator: (v) => v == null ? 'Sélection obligatoire' : null,
            ),
            const SizedBox(height: 22),

            // Date Début
            Text(
              'Date Début',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _pickDate(start: true),
              child: InputDecorator(
                decoration: _dec('JJ - MM - AAAA'),
                child: Text(
                  _dateDebut != null ? _fmt(_dateDebut!) : 'JJ - MM - AAAA',
                  style: GoogleFonts.poppins(
                    color: _dateDebut != null
                        ? Colors.black87
                        : const Color(0xFFB5BAC7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Date Fin
            Text(
              'Date Fin',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _pickDate(start: false),
              child: InputDecorator(
                decoration: _dec('JJ - MM - AAAA'),
                child: Text(
                  _dateFin != null ? _fmt(_dateFin!) : 'JJ - MM - AAAA',
                  style: GoogleFonts.poppins(
                    color: _dateFin != null
                        ? Colors.black87
                        : const Color(0xFFB5BAC7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Audité
            Text(
              'Audité',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _auditeSel,
              items: _audites
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: GoogleFonts.poppins()),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _auditeSel = v),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: _dec('Selectionnez'),
              validator: (v) => v == null ? 'Sélection obligatoire' : null,
            ),
            const SizedBox(height: 28),

            // Bouton Enregistrer
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
                    if (_dateDebut == null || _dateFin == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Veuillez choisir les dates',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                      return;
                    }
                    if (_dateFin!.isBefore(_dateDebut!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'La date fin doit être après la date début',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Audit programmé ✅',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    );
                    context.pop();
                  }
                },
                child: Text(
                  'Enregistrer',
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

  @override
  void dispose() {
    _descCtrl.dispose();
    super.dispose();
  }
}
