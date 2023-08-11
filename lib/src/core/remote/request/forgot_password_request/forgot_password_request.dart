import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';

@JsonSerializable()
class ForgotPasswordRequest {
  @JsonKey(name: 'otp')
  final String? otp;

  @JsonKey(name: 'newPassword')
  final String? newPassword;

  ForgotPasswordRequest(
    this.newPassword,
    this.otp,
  );

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}
