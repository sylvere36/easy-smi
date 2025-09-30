import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChipWidget extends StatelessWidget {
  final String text;
  final Color color;

  const CustomChipWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
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
  }
}
