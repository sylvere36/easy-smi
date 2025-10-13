import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/theming/app_color.dart';
import 'avatar.dart';

Widget commentLine(
  String name,
  String time,
  String text, {
  String? avatarName,
}) => Padding(
  padding: const EdgeInsets.only(bottom: 12),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      avatar(avatarName ?? name),
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
                    style: GoogleFonts.poppins(
                      color: AppColors.sub,
                      fontSize: 12,
                    ),
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
