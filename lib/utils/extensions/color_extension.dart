import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get toDarkColor {
    double amount = 0.5;

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
