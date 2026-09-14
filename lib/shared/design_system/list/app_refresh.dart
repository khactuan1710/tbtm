import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Pull-to-refresh wrapper around a scrollable child. Uses the built-in
/// [RefreshIndicator]; the child must be (or contain) a scrollable that always
/// scrolls (e.g. `AlwaysScrollableScrollPhysics`).
class AppRefresh extends StatelessWidget {
  const AppRefresh({super.key, required this.onRefresh, required this.child});

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      backgroundColor: AppColors.surface,
      child: child,
    );
  }
}
