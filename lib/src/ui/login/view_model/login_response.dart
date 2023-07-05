// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'idUser')
  final int? idUser;

  @JsonKey(name: 'type')
  final String? type;


  @JsonKey(name: 'email')
  final String? email;

  LoginResponse({
    this.token,
    this.type,
    this.email,
    this.idUser,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
