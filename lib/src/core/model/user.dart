import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'birthDay')
  final String? birthday;
  @JsonKey(name: 'avatar')
  final String? avatar;

  UserDTO({
    this.id,
    this.gender,
    this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.birthday,
  });

  // @JsonKey(name: 'fileAvatar')
  // final String? fileAvatar;

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

