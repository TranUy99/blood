import 'package:json_annotation/json_annotation.dart';

import '../../model/role.dart';

part 'change_information_response.g.dart';

//Receive message, token, idUser, type, email, role from api
@JsonSerializable()
class ChangeInformationResponse {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'birthDay')
  final String? birthday;

  @JsonKey(name: 'authProvider')
  final bool? authProvider;

  @JsonKey(name: 'roleDTO')
  final RoleDTO? roleDTO;

  @JsonKey(name: 'statusDTO')
  final bool? statusDTO;

  ChangeInformationResponse(this.id, this.gender, this.email, this.fullName, this.birthday, this.authProvider, this.roleDTO, this.statusDTO);

  factory ChangeInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeInformationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeInformationResponseToJson(this);
}