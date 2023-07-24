import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

//Send email, password, fullname to api
@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    this.email,
    this.password,
    this.fullName,
  });

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'fullName')
  final String? fullName;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
