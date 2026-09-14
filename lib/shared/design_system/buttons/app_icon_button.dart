import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Rounded, soft-tinted icon button used in app bars and cards.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
    this.backgroundColor,
    this.size,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: backgroundColor ?? AppColors.primarySoft,
      borderRadius: BorderRadius.circular(12.s),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.s),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(9.s),
          child: Icon(icon, size: size ?? 20.s, color: color ?? AppColors.primary),
        ),
      ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip!, child: button);
  }
}
