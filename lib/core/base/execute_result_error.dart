import 'package:quanlymaygiat/core/errors/failures.dart';

/// Error payload passed to `executeResult`'s `onError` callback so screens can
/// branch on a transport/[Failure] error versus an envelope-only error
/// (`isSuccess == false`), where [failure] is null.
class ExecuteResultError {
  const ExecuteResultError({required this.message, this.failure});

  final String message;
  final Failure? failure;
}
