import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Branded spinner. Used inline and inside the loading overlay dialog.
class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size, this.color, this.label});

  final double? size;
  final Color? color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final spinner = SizedBox(
      width: size ?? 40.s,
      height: size ?? 40.s,
      child: CircularProgressIndicator(
        strokeWidth: 3.2,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      ),
    );

    return Container(
      padding: EdgeInsets.all(20.s),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18.s),
        boxShadow: const [
          BoxShadow(color: AppColors.shadowStrong, blurRadius: 24, offset: Offset(0, 8)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spinner,
          if (label != null) ...[
            SizedBox(height: 12.s),
            Text(
              label!,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13.s),
            ),
          ],
        ],
      ),
    );
  }
}
