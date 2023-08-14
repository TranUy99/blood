// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      roleDTO: json['roleDTO'] == null
          ? null
          : RoleDTO.fromJson(json['roleDTO'] as Map<String, dynamic>),
      id: json['id'] as int?,
      gender: json['gender'] as int?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      birthday: json['birthDay'] as String?,
      statusDTO: json['statusDTO'] as bool?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'email': instance.email,
      'fullName': instance.fullName,
      'birthDay': instance.birthday,
      'roleDTO': instance.roleDTO,
      'statusDTO': instance.statusDTO,
    };
