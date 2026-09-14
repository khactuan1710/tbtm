import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';

/// Typography scale (Material 3 names). Uses the platform default font so the
/// app ships without bundling font files; swap `_family` to a bundled family
/// later if desired. `letterSpacing: 0` keeps Vietnamese diacritics tight.
class AppTypography {
  AppTypography._();

  static const String? _family = null; // platform default (San Francisco / Roboto)

  static TextStyle _base(double size, FontWeight weight, {double height = 1.35}) =>
      TextStyle(
        fontFamily: _family,
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: 0,
      );

  static TextStyle get displayLarge => _base(32.s, FontWeight.w700, height: 1.2);
  static TextStyle get displayMedium => _base(28.s, FontWeight.w700, height: 1.2);
  static TextStyle get displaySmall => _base(24.s, FontWeight.w700, height: 1.25);

  static TextStyle get headlineLarge => _base(22.s, FontWeight.w700);
  static TextStyle get headlineMedium => _base(20.s, FontWeight.w700);
  static TextStyle get headlineSmall => _base(18.s, FontWeight.w600);

  static TextStyle get titleLarge => _base(18.s, FontWeight.w600);
  static TextStyle get titleMedium => _base(16.s, FontWeight.w600);
  static TextStyle get titleSmall => _base(14.s, FontWeight.w600);

  static TextStyle get bodyLarge => _base(16.s, FontWeight.w400, height: 1.45);
  static TextStyle get bodyMedium => _base(14.s, FontWeight.w400, height: 1.45);
  static TextStyle get bodySmall => _base(12.s, FontWeight.w400, height: 1.4);

  static TextStyle get labelLarge => _base(14.s, FontWeight.w600);
  static TextStyle get labelMedium => _base(12.s, FontWeight.w600);
  static TextStyle get labelSmall => _base(11.s, FontWeight.w500);

  static TextStyle get button => labelLarge;

  static TextTheme get textTheme => TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}
