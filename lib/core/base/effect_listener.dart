import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/base/effects.dart';
import 'package:quanlymaygiat/shared/design_system/banners/app_snackbar.dart';
import 'package:quanlymaygiat/shared/design_system/loading/app_loading.dart';

/// Listens to a cubit's [BaseCubit.effects] and renders the loading overlay +
/// success/error snackbars. Mounted automatically by [BasePage] so screens
/// never manage loading dialogs or snackbars themselves.
class EffectListener<C extends BaseCubit<Object?>> extends StatefulWidget {
  const EffectListener({super.key});

  @override
  State<EffectListener<C>> createState() => _EffectListenerState<C>();
}

class _EffectListenerState<C extends BaseCubit<Object?>>
    extends State<EffectListener<C>> {
  static bool _isLoadingShown = false;

  StreamSubscription<Effect>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = context.read<C>().effects.listen(_onEffect);
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  void _onEffect(Effect effect) {
    if (!mounted) return;
    switch (effect) {
      case ShowLoading():
        _showLoading();
      case HideLoading():
        _hideLoading();
      case ShowError(:final message):
        _hideLoading();
        AppSnackBar.showError(context, message);
      case ShowSuccess(:final message):
        _hideLoading();
        AppSnackBar.showSuccess(context, message);
    }
  }

  void _showLoading() {
    if (_isLoadingShown) return;
    _isLoadingShown = true;
    unawaited(
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black26,
        useRootNavigator: true,
        builder: (_) => const PopScope(
          canPop: false,
          child: Center(child: AppLoading()),
        ),
      ).whenComplete(() => _isLoadingShown = false),
    );
  }

  void _hideLoading() {
    if (!_isLoadingShown) return;
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) navigator.pop();
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
