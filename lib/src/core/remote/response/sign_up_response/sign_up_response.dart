import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

//Receive user data from api
@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'birthDay')
  final String? birthDay;

  @JsonKey(name: 'authProvider')
  final String? authProvider;

  @JsonKey(name: 'statusDTO')
  final bool? statusDTO;
  @JsonKey(name: 'message')
  final String? message;

  SignUpResponse({
    this.email,
    this.birthDay,
    this.fullName,
    this.authProvider,
    this.statusDTO,
    this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
