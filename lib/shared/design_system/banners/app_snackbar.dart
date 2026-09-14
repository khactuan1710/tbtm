import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

enum _SnackKind { success, error, info }

/// Floating snackbars with an icon + accent color, shown via the root
/// [ScaffoldMessenger]. Used by [EffectListener] for success/error feedback.
class AppSnackBar {
  AppSnackBar._();

  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, _SnackKind.success);

  static void showError(BuildContext context, String message) =>
      _show(context, message, _SnackKind.error);

  static void showInfo(BuildContext context, String message) =>
      _show(context, message, _SnackKind.info);

  static void _show(BuildContext context, String message, _SnackKind kind) {
    final (color, bg, icon) = switch (kind) {
      _SnackKind.success => (
        AppColors.success,
        AppColors.successSoft,
        Icons.check_circle_rounded,
      ),
      _SnackKind.error => (
        AppColors.error,
        AppColors.errorSoft,
        Icons.error_rounded,
      ),
      _SnackKind.info => (AppColors.info, AppColors.infoSoft, Icons.info_rounded),
    };

    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: bg,
          elevation: 2,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.s),
            side: BorderSide(color: color.withValues(alpha: 0.35)),
          ),
          content: Row(
            children: [
              Icon(icon, color: color, size: 22.s),
              SizedBox(width: 10.s),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14.s,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
