import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: 'oldPassword')
  final String? oldPassword;

  @JsonKey(name: 'newPassword')
  final String? newPassword;

  ChangePasswordRequest({
    this.newPassword,
    this.oldPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
