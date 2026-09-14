import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/buttons/app_button.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Error placeholder with a retry action.
class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    this.message = 'Đã có lỗi xảy ra',
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.s),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20.s),
              decoration: const BoxDecoration(
                color: AppColors.errorSoft,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.wifi_off_rounded, size: 44.s, color: AppColors.error),
            ),
            SizedBox(height: 16.s),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.s, color: AppColors.textSecondary),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 20.s),
              AppButton(
                label: 'Thử lại',
                icon: Icons.refresh_rounded,
                fullWidth: false,
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
