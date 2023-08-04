import 'package:json_annotation/json_annotation.dart';

part 'send_email_forgot_password_response.g.dart';

@JsonSerializable()
class SendEmailForgotPasswordResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'path')
  final String? path;

  @JsonKey(name: 'httpCode')
  final int? httpCode;

  SendEmailForgotPasswordResponse(this.message, this.path, this.httpCode);

  factory SendEmailForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailForgotPasswordResponseToJson(this);
}