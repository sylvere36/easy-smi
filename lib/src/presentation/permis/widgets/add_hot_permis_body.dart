// import nécessaires
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddHotPermisBody extends StatefulWidget {
  const AddHotPermisBody({super.key});

  @override
  State<AddHotPermisBody> createState() => _AddHotPermisBodyState();
}

class _AddHotPermisBodyState extends State<AddHotPermisBody> {
  bool canNextStep = false;

  @override
  Widget build(BuildContext context) {
    return canNextStep
        ? const HotWorkSpecBody()
        : HotWorkPermitBody(
            onPressedNext: () {
              setState(() {
                canNextStep = true;
              });
            },
          );
  }
}

/// ---------- STYLES RAPIDES ----------
TextStyle _title(BuildContext c) => GoogleFonts.inter(
  fontSize: 28,
  height: 1.2,
  fontWeight: FontWeight.w600,
  color: const Color(0xFF0C3C3B),
);
TextStyle _label(BuildContext c) => GoogleFonts.inter(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: Colors.black87,
);
InputDecoration _fieldDec(String hint) => InputDecoration(
  hintText: hint,
  hintStyle: GoogleFonts.inter(color: Colors.black38, fontSize: 16),
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.black54, width: 1.2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Color(0xFF1667D9), width: 2),
  ),
);

Color get _primary => const Color(0xFF1667D9);

/// =================================================================================
/// ÉCRAN 1 : FORMULAIRE
/// =================================================================================
class HotWorkPermitBody extends StatefulWidget {
  const HotWorkPermitBody({super.key, required this.onPressedNext});
  final void Function() onPressedNext;

  @override
  State<HotWorkPermitBody> createState() => _HotWorkPermitBodyState();
}

class _HotWorkPermitBodyState extends State<HotWorkPermitBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  String? _type;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text(
              'Permis de travail à chaud',
              style: _title(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),

            // Titre
            Text('Titre de travail', style: _label(context)),
            const SizedBox(height: 10),
            TextFormField(
              controller: _titleCtrl,
              decoration: _fieldDec('I'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 24),

            // Type
            Text('Type de travail', style: _label(context)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _type,
              decoration: _fieldDec('Selectionnez'),
              items: const [
                DropdownMenuItem(
                  value: 'Normal',
                  child: Text('Travail Normal'),
                ),
                DropdownMenuItem(
                  value: 'Dangereux',
                  child: Text('Travail Dangereux'),
                ),
              ],
              onChanged: (v) => setState(() => _type = v),
              validator: (v) => v == null ? 'Sélection obligatoire' : null,
            ),
            const SizedBox(height: 24),

            // Description
            Text('Description', style: _label(context)),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descCtrl,
              minLines: 8,
              maxLines: 12,
              decoration: _fieldDec('I'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
            ),
            const SizedBox(height: 28),

            // Bouton Suivant
            SizedBox(
              height: 64,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onPressedNext();
                  }
                },
                child: Text(
                  'SUIVANT',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.1,
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

/// =================================================================================
/// ÉCRAN 2 : SPÉCIFICATIONS (Durée quotidienne + Plage de dates)
/// =================================================================================
class HotWorkSpecBody extends StatefulWidget {
  const HotWorkSpecBody({super.key});

  @override
  State<HotWorkSpecBody> createState() => _HotWorkSpecBodyState();
}

class _HotWorkSpecBodyState extends State<HotWorkSpecBody> {
  // time pickers
  int hours = 7;
  int minutes = 0;

  // calendar state (inline range picker)
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  List<int> get _hours => List.generate(24, (i) => i);
  List<int> get _mins => List.generate(60, (i) => i);

  @override
  Widget build(BuildContext context) {
    final monthLabel = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Text(
            'Specification du travail',
            style: _title(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Durée du travail par jour
          Text('Durée du travail par jour', style: _label(context)),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timeBox(
                child: _cupertinoWheel(
                  extent: 64,
                  items: _hours,
                  initial: hours,
                  onSelected: (v) => setState(() => hours = v),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  ':',
                  style: GoogleFonts.inter(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _timeBox(
                child: _cupertinoWheel(
                  extent: 64,
                  items: _mins,
                  initial: minutes,
                  onSelected: (v) => setState(() => minutes = v),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Date des travaux (inline range)
          Text('Date des travaux', style: _label(context)),
          const SizedBox(height: 10),

          // Sélecteur mois
          InkWell(
            onTap: () async {
              // Simple picker mois/année
              await showModalBottomSheet(
                context: context,
                showDragHandle: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => _MonthYearPicker(
                  initial: _month,
                  onSelected: (d) => setState(() {
                    _month = DateTime(d.year, d.month);
                    // reset la plage si elle sort du mois
                    _rangeStart = null;
                    _rangeEnd = null;
                  }),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_formatMonth(_month), style: monthLabel),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 26),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          _InlineMonthRange(
            month: _month,
            start: _rangeStart,
            end: _rangeEnd,
            onChanged: (s, e) => setState(() {
              _rangeStart = s;
              _rangeEnd = e;
            }),
            accent: _primary,
          ),
          const SizedBox(height: 18),

          // Résumé plage
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE2ECFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date debut',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      if (_rangeStart != null)
                        Text(
                          _fullDate(_rangeStart!),
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date fin',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      if (_rangeEnd != null)
                        Text(
                          _fullDate(_rangeEnd!),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Enregistrer
          SizedBox(
            height: 64,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: (_rangeStart != null && _rangeEnd != null)
                  ? () {
                      context.pop();
                    }
                  : null,
              child: Text(
                'Enregistrer',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helpers UI
  Widget _timeBox({required Widget child}) => Container(
    width: 110,
    height: 110,
    decoration: BoxDecoration(
      color: const Color(0xFFEFE7FF),
      borderRadius: BorderRadius.circular(16),
    ),
    child: child,
  );

  Widget _cupertinoWheel({
    required List<int> items,
    required int initial,
    required ValueChanged<int> onSelected,
    double extent = 56,
  }) {
    final ctrl = FixedExtentScrollController(initialItem: initial);
    return CupertinoPicker(
      scrollController: ctrl,
      itemExtent: extent,
      magnification: 1.08,
      useMagnifier: true,
      onSelectedItemChanged: onSelected,
      children: items
          .map(
            (e) => Center(
              child: Text(
                e.toString().padLeft(2, '0'),
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

/// ---------- Inline month range picker ----------
class _InlineMonthRange extends StatefulWidget {
  final DateTime month; // 1er jour du mois
  final DateTime? start;
  final DateTime? end;
  final ValueChanged<DateTime?>? onStartTap;
  final Function(DateTime?, DateTime?) onChanged;
  final Color accent;

  const _InlineMonthRange({
    required this.month,
    required this.start,
    required this.end,
    required this.onChanged,
    this.onStartTap,
    required this.accent,
  });

  @override
  State<_InlineMonthRange> createState() => _InlineMonthRangeState();
}

class _InlineMonthRangeState extends State<_InlineMonthRange> {
  late DateTime _firstDay;
  late int _daysInMonth;

  @override
  void didUpdateWidget(covariant _InlineMonthRange oldWidget) {
    super.didUpdateWidget(oldWidget);
    _calc();
  }

  @override
  void initState() {
    super.initState();
    _calc();
  }

  void _calc() {
    _firstDay = DateTime(widget.month.year, widget.month.month);
    _daysInMonth = DateTime(widget.month.year, widget.month.month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    final startOffset = _firstDay.weekday % 7; // 0 = Dim
    final cells = startOffset + _daysInMonth;
    final rows = (cells / 7).ceil();

    final dow = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dow
                .map(
                  (d) => Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        AspectRatio(
          aspectRatio: 7 / rows,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: rows * 7,
            itemBuilder: (_, i) {
              final dayNum = i - startOffset + 1;
              if (dayNum < 1 || dayNum > _daysInMonth) {
                return const SizedBox.shrink();
              }
              final date = DateTime(
                widget.month.year,
                widget.month.month,
                dayNum,
              );

              final inRange = (widget.start != null && widget.end != null)
                  ? !date.isBefore(_onlyDate(widget.start!)) &&
                        !date.isAfter(_onlyDate(widget.end!))
                  : false;

              final isStart =
                  widget.start != null && _isSameDay(date, widget.start!);
              final isEnd = widget.end != null && _isSameDay(date, widget.end!);

              Color bg;
              BorderRadius? r;
              if (isStart && isEnd) {
                bg = widget.accent;
                r = BorderRadius.circular(12);
              } else if (isStart) {
                bg = widget.accent;
                r = const BorderRadius.horizontal(left: Radius.circular(12));
              } else if (isEnd) {
                bg = widget.accent;
                r = const BorderRadius.horizontal(right: Radius.circular(12));
              } else if (inRange) {
                bg = widget.accent.withValues(alpha: .25);
                r = null;
              } else {
                bg = Colors.transparent;
              }

              return Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    DateTime? s = widget.start;
                    DateTime? e = widget.end;

                    if (s == null || (e != null)) {
                      s = date;
                      e = null;
                    } else {
                      if (date.isBefore(s)) {
                        e = s;
                        s = date;
                      } else {
                        e = date;
                      }
                    }
                    widget.onChanged(s, e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: r ?? BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '$dayNum',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: (isStart || isEnd)
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  DateTime _onlyDate(DateTime d) => DateTime(d.year, d.month, d.day);
  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

/// ---------- Sélecteur Mois/Année (bottom sheet) ----------
class _MonthYearPicker extends StatefulWidget {
  final DateTime initial;
  final ValueChanged<DateTime> onSelected;
  const _MonthYearPicker({required this.initial, required this.onSelected});

  @override
  State<_MonthYearPicker> createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<_MonthYearPicker> {
  late int _month;
  late int _year;

  @override
  void initState() {
    super.initState();
    _month = widget.initial.month;
    _year = widget.initial.year;
  }

  @override
  Widget build(BuildContext context) {
    final months = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre',
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choisir le mois',
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _month,
                  decoration: _fieldDec('Mois'),
                  items: List.generate(
                    12,
                    (i) =>
                        DropdownMenuItem(value: i + 1, child: Text(months[i])),
                  ),
                  onChanged: (v) => setState(() => _month = v ?? _month),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _year,
                  decoration: _fieldDec('Année'),
                  items: List.generate(7, (i) {
                    final y = DateTime.now().year - 2 + i;
                    return DropdownMenuItem(value: y, child: Text('$y'));
                  }),
                  onChanged: (v) => setState(() => _year = v ?? _year),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                widget.onSelected(DateTime(_year, _month));
                Navigator.pop(context);
              },
              child: Text(
                'Valider',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// ---------- util ----------
String _formatMonth(DateTime d) {
  const m = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre',
  ];
  return '${m[d.month - 1]} ${d.year}';
}

String _fullDate(DateTime d) {
  const wd = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
  const m = [
    'Jan',
    'Fév',
    'Mar',
    'Avr',
    'Mai',
    'Juin',
    'Juil',
    'Aoû',
    'Sep',
    'Oct',
    'Nov',
    'Déc',
  ];
  return '${wd[(d.weekday + 6) % 7]} ${d.day}, ${m[d.month - 1]} ${d.year}';
}
