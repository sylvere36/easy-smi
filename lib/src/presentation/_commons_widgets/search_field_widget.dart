import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFieldWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function()? onClear;
  final TextEditingController? controller;
  const SearchFieldWidget({
    super.key,
    this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late final TextEditingController _search;

  @override
  void initState() {
    super.initState();
    _search = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _search.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _search,
      autocorrect: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF0E1117),
      ),
      onChanged: (value) {
        setState(() {}); // Rebuild pour mettre à jour l'icône
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
        hintText: 'Recherche',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        filled: true,
        fillColor: const Color(0xFFF2F4F7),
        suffixIcon: IconButton(
          onPressed: () {
            if (_search.text.isNotEmpty) {
              _search.clear();
              setState(() {}); // Rebuild pour mettre à jour l'icône
              if (widget.onClear != null) {
                widget.onClear!();
              }
            }
          },
          icon: _search.text.isEmpty
              ? const Icon(Icons.search_rounded)
              : const Icon(Icons.clear_rounded),
          color: const Color(0xFF9AA0A6),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: GoogleFonts.nunito(
          color: const Color(0xFF9AA0A6),
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
