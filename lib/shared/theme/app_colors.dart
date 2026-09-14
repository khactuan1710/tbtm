import 'package:flutter/material.dart';

/// Design-system colors. A clean, modern "fresh water" laundry palette:
/// a friendly blue primary with a teal accent, plus clear semantic status
/// colors for machine states (running / idle / offline).
///
/// Each literal appears once; semantic aliases reference those literals.
class AppColors {
  AppColors._();

  // --- Brand -----------------------------------------------------------------
  static const Color primary = Color(0xFF2563EB); // vivid friendly blue
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryDeep = Color(0xFF1E3A8A);
  static const Color primarySoft = Color(0xFFDCEAFE); // tint background
  static const Color primary60 = Color(0xFF7EA6F5);

  static const Color secondary = Color(0xFF14B8A6); // teal accent
  static const Color secondarySoft = Color(0xFFCCFBF1);

  // --- Surfaces / background -------------------------------------------------
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF3F6FB); // very light blue-grey
  static const Color scaffold = Color(0xFFF3F6FB);
  static const Color card = Color(0xFFFFFFFF);

  // --- Text ------------------------------------------------------------------
  static const Color textPrimary = Color(0xFF0F172A); // slate-900
  static const Color textSecondary = Color(0xFF475569); // slate-600
  static const Color textTertiary = Color(0xFF94A3B8); // slate-400
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color textLink = primary;

  // --- Lines / strokes -------------------------------------------------------
  static const Color border = Color(0xFFE2E8F0); // slate-200
  static const Color divider = Color(0xFFEEF2F7);
  static const Color inputFill = Color(0xFFF8FAFC);
  static const Color inputBorder = Color(0xFFD9E1EC);
  static const Color inputFocusBorder = primary;
  static const Color inputHint = Color(0xFF9AA7B8);
  static const Color disabled = Color(0xFFCBD5E1);
  static const Color disabledBg = Color(0xFFEDF1F6);

  // --- Semantic --------------------------------------------------------------
  static const Color success = Color(0xFF16A34A);
  static const Color successSoft = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningSoft = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFDC2626);
  static const Color errorSoft = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF0284C7);
  static const Color infoSoft = Color(0xFFE0F2FE);

  // --- Machine status --------------------------------------------------------
  static const Color statusRunning = Color(0xFF16A34A); // on / washing
  static const Color statusIdle = Color(0xFF64748B); // off / idle
  static const Color statusOffline = Color(0xFFDC2626); // disconnected

  // --- Shadows / overlays ----------------------------------------------------
  static const Color shadow = Color(0x14101828); // 8% slate
  static const Color shadowStrong = Color(0x1F101828);
  static const Color scrim = Color(0x66000000);

  // --- Auth gradient ---------------------------------------------------------
  static const Color authGradientTop = Color(0xFF2563EB);
  static const Color authGradientMid = Color(0xFF1D4ED8);
  static const Color authGradientBottom = Color(0xFF1E3A8A);

  // --- Skeleton --------------------------------------------------------------
  static const Color skeletonBase = Color(0xFFE7ECF3);
  static const Color skeletonHighlight = Color(0xFFF3F6FB);

  // --- Dark surfaces ---------------------------------------------------------
  static const Color backgroundDark = Color(0xFF0B1220);
  static const Color surfaceDark = Color(0xFF141C2B);
  static const Color onSurfaceDark = Color(0xFFE6ECF5);
  static const Color borderDark = Color(0xFF2A3550);

  // --- Aliases ---------------------------------------------------------------
  static const Color onPrimary = surface;
  static const Color onSurface = textPrimary;
  static const Color onError = surface;

  static ColorScheme get lightScheme => ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
    primary: primary,
    secondary: secondary,
    error: error,
    surface: surface,
    onPrimary: onPrimary,
    onSurface: onSurface,
    onError: onError,
  );

  static ColorScheme get darkScheme => ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.dark,
    primary: primary60,
    secondary: secondary,
    error: error,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    onError: onError,
  );
}
