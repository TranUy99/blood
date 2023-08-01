// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'idUser')
  final int? idUser;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'role')
  final String? role;

  LoginResponse(this.error, {
    this.role,
    this.message,
    this.token,
    this.type,
    this.email,
    this.idUser,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
