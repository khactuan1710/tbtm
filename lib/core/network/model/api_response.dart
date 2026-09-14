import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

typedef JsonFactory<T> = T Function(Object? json);

/// Envelope fields the [BaseCubit.executeResult] helper inspects to decide
/// whether a call succeeded, regardless of the concrete payload type.
abstract interface class HasApiEnvelope {
  bool? get isSuccess;
  String? get message;
}

/// Standard `maygiat.online` response envelope:
/// ```json
/// { "isSuccess": true, "message": "Thành công", "data": T }
/// ```
/// `data` may be an object or a list — the generic [T] captures both.
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> implements HasApiEnvelope {
  const ApiResponse({this.isSuccess, this.message, this.data, this.error});

  @override
  final bool? isSuccess;
  @override
  final String? message;
  final T? data;
  final String? error;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    JsonFactory<T> fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
