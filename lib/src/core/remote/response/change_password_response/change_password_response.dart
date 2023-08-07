import 'package:json_annotation/json_annotation.dart';

part 'change_password_response.g.dart';

//Receive message, errors from api
@JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'path')
  final String? path;

  ChangePasswordResponse(this.message, this.path, this.error);

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
