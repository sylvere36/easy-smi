import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget avatar(
  String name, {
  String? imageUrl,
  double radius = 20,
  double? size,
}) {
  final parts = name.split(' ');
  final initials =
      (parts.isNotEmpty ? parts.first.characters.first : '') +
      (parts.length > 1 ? parts.last.characters.first : '');
  return CircleAvatar(
    radius: radius,
    backgroundColor: const Color(0xFF1DBA9F),
    child: Text(
      initials.toUpperCase(),
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: size ?? radius * 0.8,
      ),
    ),
  );
}
