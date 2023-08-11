import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/role.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDTO {
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


  @JsonKey(name: 'roleDTO')
  final RoleDTO? roleDTO;

  @JsonKey(name: 'statusDTO')
  final bool? statusDTO;

  UserDTO({
    this.roleDTO,
    this.id,
    this.gender,
    this.email,
    this.fullName,
    this.birthday,
   
    this.statusDTO,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

