import 'dart:math';

import 'package:flutter/material.dart';

MaterialColor getMaterialColor(Color color) => MaterialColor(color.hashCode, {
  50: tintColor(color, 0.9),
  100: tintColor(color, 0.8),
  200: tintColor(color, 0.6),
  300: tintColor(color, 0.4),
  400: tintColor(color, 0.2),
  500: color,
  600: shadeColor(color, 0.1),
  700: shadeColor(color, 0.2),
  800: shadeColor(color, 0.3),
  900: shadeColor(color, 0.4),
});
int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
  tintValue(color.r.toInt(), factor),
  tintValue(color.g.toInt(), factor),
  tintValue(color.b.toInt(), factor),
  1,
);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
  shadeValue(color.r.toInt(), factor),
  shadeValue(color.g.toInt(), factor),
  shadeValue(color.b.toInt(), factor),
  1,
);
