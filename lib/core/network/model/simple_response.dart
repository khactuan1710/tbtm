import 'package:json_annotation/json_annotation.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';

part 'simple_response.g.dart';

/// Envelope for endpoints that return only a status/message (no payload),
/// e.g. toggle / create / update / change-password.
@JsonSerializable()
class SimpleResponse implements HasApiEnvelope {
  const SimpleResponse({this.isSuccess, this.message, this.error});

  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'error')
  final String? error;

  factory SimpleResponse.fromJson(Map<String, dynamic> json) =>
      _$SimpleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleResponseToJson(this);
}
