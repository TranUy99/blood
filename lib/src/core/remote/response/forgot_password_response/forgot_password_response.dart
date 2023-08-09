import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'path')
  final String? path;

  @JsonKey(name: 'httpCode')
  final int? httpCode;

  @JsonKey(name: 'error')
  final String? error;

  ForgotPasswordResponse(this.message, this.path, this.httpCode, this.error);

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
