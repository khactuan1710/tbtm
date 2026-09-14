import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quanlymaygiat/app_router.dart';
import 'package:quanlymaygiat/core/di/injection.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/auth/data/auth_session_notifier.dart';

/// Listens for session-expired events (401) and routes back to login, clearing
/// the stored session so the user must sign in again.
class AppSessionLifecycle extends StatefulWidget {
  const AppSessionLifecycle({super.key, required this.router, required this.child});

  final AppRouter router;
  final Widget child;

  @override
  State<AppSessionLifecycle> createState() => _AppSessionLifecycleState();
}

class _AppSessionLifecycleState extends State<AppSessionLifecycle> {
  StreamSubscription<void>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription =
        getIt<AuthSessionNotifier>().onSessionExpired.listen((_) => _onExpired());
  }

  Future<void> _onExpired() async {
    await getIt<AuthLocalStore>().clear();
    await widget.router.replaceAll([const LoginRoute()]);
    getIt<AuthSessionNotifier>().reset();
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
