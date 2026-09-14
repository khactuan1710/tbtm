import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quanlymaygiat/core/errors/failures.dart';

/// Maps a low-level [DioException] to a domain [Failure].
Failure mapDioExceptionToFailure(DioException err) {
  if (err.response?.statusCode == 401) {
    return Failure.unauthorized(message: _messageOf(err.response?.data));
  }

  if (err.type == DioExceptionType.connectionTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.receiveTimeout) {
    return const Failure.timeout();
  }

  if (err.type == DioExceptionType.connectionError ||
      err.error is SocketException) {
    return const Failure.network();
  }

  if (err.response != null) {
    return Failure.server(
      message: _messageOf(err.response?.data),
      statusCode: err.response?.statusCode,
      data: err.response?.data,
    );
  }

  return Failure.unknown(
    message: err.message,
    error: err.error,
    stackTrace: err.stackTrace,
  );
}

String? _messageOf(dynamic data) {
  if (data is Map && data['message'] is String) {
    return data['message'] as String;
  }
  return null;
}
