import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Union of all app-level failures for consistent error handling.
@Freezed(unionKey: 'type')
sealed class Failure with _$Failure {
  const Failure._();

  const factory Failure.network({String? message, int? statusCode}) =
      NetworkFailure;

  const factory Failure.unauthorized({String? message}) = UnauthorizedFailure;

  const factory Failure.server({String? message, int? statusCode, dynamic data}) =
      ServerFailure;

  const factory Failure.timeout({String? message}) = TimeoutFailure;

  const factory Failure.unknown({
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) = UnknownFailure;
}

extension FailureX on Failure {
  String get displayMessage => switch (this) {
    NetworkFailure(:final message) =>
      message ?? 'Không có kết nối Internet. Vui lòng thử lại sau.',
    UnauthorizedFailure(:final message) =>
      message ?? 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
    ServerFailure(:final message) =>
      message ?? 'Máy chủ đang bận. Vui lòng thử lại sau.',
    TimeoutFailure(:final message) =>
      message ?? 'Yêu cầu quá thời gian. Vui lòng thử lại.',
    UnknownFailure(:final message) => message ?? 'Đã có lỗi xảy ra.',
  };
}
