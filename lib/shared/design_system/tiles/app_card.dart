import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// White rounded container with a soft shadow — the base surface for list items
/// and sections. Optionally tappable.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius,
    this.border,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 16.s);
    final content = Container(
      padding: padding ?? EdgeInsets.all(16.s),
      decoration: BoxDecoration(
        color: color ?? AppColors.card,
        borderRadius: radius,
        border: border,
        boxShadow: const [
          BoxShadow(color: AppColors.shadow, blurRadius: 16, offset: Offset(0, 4)),
        ],
      ),
      child: child,
    );

    return Container(
      margin: margin,
      child: onTap == null
          ? content
          : Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: radius,
                onTap: onTap,
                child: content,
              ),
            ),
    );
  }
}
