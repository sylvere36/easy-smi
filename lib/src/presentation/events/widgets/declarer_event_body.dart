import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeclarerEventBody extends StatefulWidget {
  const DeclarerEventBody({super.key});

  @override
  State<DeclarerEventBody> createState() => _DeclarerEventBodyState();
}

class _DeclarerEventBodyState extends State<DeclarerEventBody> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _site = TextEditingController();

  String? _type;
  String? _gravite;
  DateTime? _date;
  final List<String> _temoins = [];
  final List<_Proof> _proofs = [];

  // listes
  static const _types = [
    'Accident',
    'Incident',
    'Situation dangereuse',
    'Non conformité',
  ];
  static const _gravites = ['Mineur', 'Majeur', 'Critique'];

  TextStyle get _label =>
      GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 18);
  InputDecoration _filled(String hint, {Widget? suffix}) => InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(color: Colors.black45),
    suffixIcon: suffix,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF1565D8), width: 1.4),
    ),
  );

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    _site.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
      children: [
        // ---------- Titre ----------
        Text('Titre de l’evennement', style: _label),
        const SizedBox(height: 10),
        TextField(controller: _title, decoration: _filled('I')),
        const SizedBox(height: 22),

        // ---------- Type ----------
        Text('Type de l’evennement', style: _label),
        const SizedBox(height: 10),
        _SelectTile(
          valueText: _type ?? 'Selectionnez',
          onTap: () => _showPicker(
            title: 'Type de l’évènement',
            options: _types,
            current: _type,
            onSelect: (v) => setState(() => _type = v),
          ),
        ),
        const SizedBox(height: 22),

        // ---------- Description ----------
        Text('Description', style: _label),
        const SizedBox(height: 10),
        TextField(
          controller: _desc,
          maxLines: 6,
          decoration: _filled('Description de l’audit'),
        ),
        const SizedBox(height: 22),

        // ---------- Gravité ----------
        Text('Gravité', style: _label),
        const SizedBox(height: 10),
        _SelectTile(
          valueText: _gravite ?? 'Selectionnez',
          onTap: () => _showPicker(
            title: 'Gravité',
            options: _gravites,
            current: _gravite,
            onSelect: (v) => setState(() => _gravite = v),
          ),
        ),
        const SizedBox(height: 22),

        // ---------- Date ----------
        Text('Date', style: _label),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _pickDate,
          child: AbsorbPointer(
            child: TextField(
              decoration: _filled(
                _date == null ? 'JJ - MM - AAAA' : _fmtDate(_date!),
                suffix: const Icon(Icons.calendar_today_rounded),
              ),
            ),
          ),
        ),
        const SizedBox(height: 22),

        // ---------- Site ----------
        Text('Site', style: _label),
        const SizedBox(height: 10),
        TextField(controller: _site, decoration: _filled('Saisir le site')),
        const SizedBox(height: 22),

        // ---------- Temoins ----------
        Text('Temoins ou Personnes concernées', style: _label),
        const SizedBox(height: 10),
        _SelectTile(
          valueText: _temoins.isEmpty ? 'Selectionnez' : _temoins.join(', '),
          onTap: _pickTemoins,
        ),
        if (_temoins.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: -6,
            children: _temoins
                .map(
                  (t) => Chip(
                    label: Text(t, style: GoogleFonts.inter()),
                    backgroundColor: const Color(0xFFEFF6FF),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () => setState(() => _temoins.remove(t)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        const SizedBox(height: 22),

        // ---------- Preuves ----------
        Text('Image / Preuves', style: _label),
        const SizedBox(height: 10),
        _SelectTile(
          valueText: _proofs.isEmpty ? 'Selectionnez' : 'Ajouter / Gérer',
          onTap: _pickProofs,
        ),
        const SizedBox(height: 12),
        if (_proofs.isNotEmpty)
          _ProofGrid(
            items: _proofs,
            onRemove: (p) => setState(() => _proofs.remove(p)),
          ),

        const SizedBox(height: 28),
        // ---------- CTA ----------
        SizedBox(
          height: 62,
          child: ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1565E0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 0,
            ),
            child: Text(
              'Enregistrer',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =============== helpers ===============

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
      helpText: 'Sélectionner la date',
    );
    if (d != null) setState(() => _date = d);
  }

  void _showPicker({
    required String title,
    required List<String> options,
    required String? current,
    required ValueChanged<String> onSelect,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 4,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ...options.map(
                (e) => ListTile(
                  title: Text(e, style: GoogleFonts.inter()),
                  trailing: current == e
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    onSelect(e);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickTemoins() {
    final all = ['Beatrice', 'Maxime', 'Souleyman', 'Jenan', 'Henry'];
    final selected = {..._temoins};
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (context, setSt) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text(
                  'Sélectionner des témoins',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                ...all.map(
                  (e) => CheckboxListTile(
                    value: selected.contains(e),
                    onChanged: (v) =>
                        setSt(() => v! ? selected.add(e) : selected.remove(e)),
                    title: Text(e, style: GoogleFonts.inter()),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      _temoins
                        ..clear()
                        ..addAll(selected);
                    });
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1565E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Valider',
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickProofs() {
    // Démo : on propose d’ajouter une Image, une Vidéo, ou un Fichier (icône).
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ProofChoice(
                    icon: Icons.image_rounded,
                    label: 'Image',
                    onTap: () {
                      setState(
                        () => _proofs.add(
                          _Proof.image(
                            'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=600&auto=format&fit=crop',
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  _ProofChoice(
                    icon: Icons.videocam_rounded,
                    label: 'Vidéo',
                    onTap: () {
                      setState(
                        () => _proofs.add(
                          _Proof.video(
                            'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
                            thumb:
                                'https://images.unsplash.com/photo-1532634896-26909d0d4b6a?q=80&w=600&auto=format&fit=crop',
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  _ProofChoice(
                    icon: Icons.insert_drive_file_rounded,
                    label: 'Fichier',
                    onTap: () {
                      setState(
                        () => _proofs.add(_Proof.file('Compte-rendu.pdf')),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_title.text.trim().isEmpty ||
        _type == null ||
        _gravite == null ||
        _date == null ||
        _site.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez compléter les champs obligatoires'),
        ),
      );
      return;
    }
    // Démo : affichage d’un résumé
    final msg =
        'Titre: ${_title.text}\nType: $_type\nGravité: $_gravite\nDate: ${_fmtDate(_date!)}\nSite: ${_site.text}\n'
        'Témoins: ${_temoins.join(', ')}\nPreuves: ${_proofs.length}';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Aperçu envoi',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(msg, style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
              context.pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} - ${d.month.toString().padLeft(2, '0')} - ${d.year}';
}

// ========== widgets utilitaires ==========

class _SelectTile extends StatelessWidget {
  final String valueText;
  final VoidCallback onTap;
  const _SelectTile({required this.valueText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: valueText,
            hintStyle: GoogleFonts.inter(
              color: Colors.black.withValues(alpha: .25),
            ),
            filled: true,
            fillColor: const Color(0xFFF7FCFF),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF1565D8),
                width: 1.4,
              ),
            ),
            suffixIcon: const Icon(Icons.expand_more_rounded),
          ),
        ),
      ),
    );
  }
}

class _Proof {
  final String kind; // 'image' | 'video' | 'file'
  final String value; // url ou nom de fichier
  final String? thumb;

  _Proof._(this.kind, this.value, this.thumb);
  factory _Proof.image(String url) => _Proof._('image', url, null);
  factory _Proof.video(String url, {String? thumb}) =>
      _Proof._('video', url, thumb);
  factory _Proof.file(String name) => _Proof._('file', name, null);
}

class _ProofGrid extends StatelessWidget {
  final List<_Proof> items;
  final ValueChanged<_Proof> onRemove;
  const _ProofGrid({required this.items, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items.map((p) => _tile(context, p)).toList(),
    );
  }

  Widget _tile(BuildContext context, _Proof p) {
    final r = 14.0;
    final overlayRemove = Positioned(
      right: 6,
      top: 6,
      child: GestureDetector(
        onTap: () => onRemove(p),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: const Icon(Icons.close, size: 16, color: Colors.red),
        ),
      ),
    );

    if (p.kind == 'image' || p.kind == 'video') {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: Container(
              width: 120,
              height: 90,
              color: const Color(0xFFEFF6FF),
              child: p.kind == 'image'
                  ? Image.network(p.value, fit: BoxFit.cover)
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        if (p.thumb != null)
                          Image.network(p.thumb!, fit: BoxFit.cover)
                        else
                          const Icon(
                            Icons.videocam,
                            size: 36,
                            color: Colors.black45,
                          ),
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          overlayRemove,
        ],
      );
    }
    // fichier
    return Stack(
      children: [
        Container(
          width: 140,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFF7FCFF),
            borderRadius: BorderRadius.circular(r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Icon(
                Icons.insert_drive_file_rounded,
                color: Colors.redAccent,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  p.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(),
                ),
              ),
            ],
          ),
        ),
        overlayRemove,
      ],
    );
  }
}

class _ProofChoice extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ProofChoice({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF475569)),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.inter()),
      ],
    );
  }
}
