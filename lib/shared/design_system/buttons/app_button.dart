import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

enum AppButtonVariant { filled, outlined, text }

/// Primary action button with variants, loading spinner and optional icon.
/// Defaults to full width to suit form/bottom-bar layouts.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.loading = false,
    this.fullWidth = true,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.borderRadius,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool loading;
  final bool fullWidth;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 14.s);
    final enabled = onPressed != null && !loading;

    final content = loading
        ? SizedBox(
            width: 22.s,
            height: 22.s,
            child: CircularProgressIndicator(
              strokeWidth: 2.6,
              valueColor: AlwaysStoppedAnimation<Color>(_foreground),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[Icon(icon, size: 20.s), SizedBox(width: 8.s)],
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypographyButton.style,
                ),
              ),
            ],
          );

    final Widget button = switch (variant) {
      AppButtonVariant.filled => ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? AppColors.onPrimary,
          minimumSize: Size(0, height ?? 52.s),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: content,
      ),
      AppButtonVariant.outlined => OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.primary,
          side: BorderSide(color: backgroundColor ?? AppColors.primary),
          minimumSize: Size(0, height ?? 52.s),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: content,
      ),
      AppButtonVariant.text => TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.primary,
          minimumSize: Size(0, height ?? 48.s),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: content,
      ),
    };

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Color get _foreground => switch (variant) {
    AppButtonVariant.filled => foregroundColor ?? AppColors.onPrimary,
    _ => foregroundColor ?? AppColors.primary,
  };
}

/// Small helper so the button label style is defined once.
class AppTypographyButton {
  AppTypographyButton._();
  static TextStyle get style =>
      TextStyle(fontSize: 15.s, fontWeight: FontWeight.w600, letterSpacing: 0.2);
}
