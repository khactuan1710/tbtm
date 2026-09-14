import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Friendly empty-state placeholder with an icon, message and optional action.
class AppEmpty extends StatelessWidget {
  const AppEmpty({
    super.key,
    this.message = 'Chưa có dữ liệu',
    this.icon = Icons.inbox_rounded,
    this.action,
  });

  final String message;
  final IconData icon;
  final Widget? action;

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
                color: AppColors.primarySoft,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 44.s, color: AppColors.primary),
            ),
            SizedBox(height: 16.s),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.s, color: AppColors.textSecondary),
            ),
            if (action != null) ...[SizedBox(height: 16.s), action!],
          ],
        ),
      ),
    );
  }
}
