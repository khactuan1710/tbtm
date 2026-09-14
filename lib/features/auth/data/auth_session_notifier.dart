import 'dart:async';

import 'package:injectable/injectable.dart';

/// Broadcasts session-expired events (e.g. a 401 from the API) so the app shell
/// can redirect to the login screen from anywhere.
@lazySingleton
class AuthSessionNotifier {
  final StreamController<void> _controller = StreamController<void>.broadcast();

  Stream<void> get onSessionExpired => _controller.stream;

  bool _notified = false;

  void notifySessionExpired() {
    if (_notified || _controller.isClosed) return;
    _notified = true;
    _controller.add(null);
  }

  /// Call after handling the redirect so a later 401 fires again.
  void reset() => _notified = false;

  @disposeMethod
  void dispose() => _controller.close();
}
