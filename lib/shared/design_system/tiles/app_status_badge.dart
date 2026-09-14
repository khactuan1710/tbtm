import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Pill-shaped status chip with a colored dot + label.
class AppStatusBadge extends StatelessWidget {
  const AppStatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.background,
    this.icon,
  });

  final String label;
  final Color color;
  final Color? background;
  final IconData? icon;

  /// Convenience for machine on/off state.
  factory AppStatusBadge.machine({required bool isOn}) => isOn
      ? const AppStatusBadge(
          label: 'Đang chạy',
          color: AppColors.statusRunning,
          background: AppColors.successSoft,
          icon: Icons.play_circle_fill_rounded,
        )
      : const AppStatusBadge(
          label: 'Đang tắt',
          color: AppColors.statusIdle,
          background: AppColors.disabledBg,
          icon: Icons.pause_circle_filled_rounded,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.s, vertical: 5.s),
      decoration: BoxDecoration(
        color: background ?? color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, size: 14.s, color: color)
          else
            Container(
              width: 8.s,
              height: 8.s,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          SizedBox(width: 6.s),
          Text(
            label,
            style: TextStyle(fontSize: 12.s, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }
}
