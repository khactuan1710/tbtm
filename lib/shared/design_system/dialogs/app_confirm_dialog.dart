import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/buttons/app_button.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Centered confirm/cancel dialog. Returns `true` when confirmed.
class AppConfirmDialog {
  AppConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    String? message,
    String confirmText = 'Đồng ý',
    String cancelText = 'Huỷ',
    IconData? icon,
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final accent = isDestructive ? AppColors.error : AppColors.primary;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.s)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.s, 24.s, 20.s, 16.s),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(14.s),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon ?? (isDestructive ? Icons.warning_amber_rounded : Icons.help_outline_rounded),
                    color: accent,
                    size: 32.s,
                  ),
                ),
                SizedBox(height: 16.s),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.s, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
                if (message != null) ...[
                  SizedBox(height: 8.s),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.s, color: AppColors.textSecondary, height: 1.4),
                  ),
                ],
                SizedBox(height: 22.s),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: cancelText,
                        variant: AppButtonVariant.outlined,
                        onPressed: () => Navigator.of(ctx).pop(false),
                      ),
                    ),
                    SizedBox(width: 12.s),
                    Expanded(
                      child: AppButton(
                        label: confirmText,
                        backgroundColor: accent,
                        onPressed: () => Navigator.of(ctx).pop(true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return result ?? false;
  }
}
