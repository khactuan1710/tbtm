import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/design_system/responsive/sizes.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Full-screen gradient background for auth screens, with soft decorative
/// bubbles evoking water/laundry.
class AppAuthBackground extends StatelessWidget {
  const AppAuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.authGradientTop,
            AppColors.authGradientMid,
            AppColors.authGradientBottom,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: -60.s, right: -40.s, child: _bubble(180.s, 0.12)),
          Positioned(bottom: -50.s, left: -50.s, child: _bubble(200.s, 0.10)),
          Positioned(top: 120.s, left: -30.s, child: _bubble(90.s, 0.08)),
          child,
        ],
      ),
    );
  }

  Widget _bubble(double size, double opacity) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withValues(alpha: opacity),
    ),
  );
}
