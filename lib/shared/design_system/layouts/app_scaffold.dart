import 'package:flutter/material.dart';
import 'package:quanlymaygiat/shared/theme/app_colors.dart';

/// Thin [Scaffold] wrapper defaulting to the app background and resisting the
/// keyboard from resizing the body when a bottom bar is present.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.safeAreaTop = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool safeAreaTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? AppColors.scaffold,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      body: SafeArea(top: safeAreaTop, child: body),
      bottomNavigationBar: bottomBar,
    );
  }
}
