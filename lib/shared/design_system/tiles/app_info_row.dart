import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// A label/value row used in detail screens. Label on the left, value on the
/// right (or below, when [stacked]).
class AppInfoRow extends StatelessWidget {
  const AppInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
    this.icon,
    this.stacked = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final IconData? icon;
  final bool stacked;

  @override
  Widget build(BuildContext context) {
    final labelWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16.s, color: AppColors.textTertiary),
          SizedBox(width: 6.s),
        ],
        Text(
          label,
          style: TextStyle(fontSize: 14.s, color: AppColors.textSecondary),
        ),
      ],
    );

    final valueWidget = Text(
      value,
      textAlign: stacked ? TextAlign.start : TextAlign.end,
      style: TextStyle(
        fontSize: 14.5.s,
        fontWeight: FontWeight.w600,
        color: valueColor ?? AppColors.textPrimary,
      ),
    );

    if (stacked) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [labelWidget, SizedBox(height: 4.s), valueWidget],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelWidget,
          SizedBox(width: 12.s),
          Expanded(child: Align(alignment: Alignment.centerRight, child: valueWidget)),
        ],
      ),
    );
  }
}
