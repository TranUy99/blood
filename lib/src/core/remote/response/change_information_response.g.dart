// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeInformationResponse _$ChangeInformationResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeInformationResponse(
      json['id'] as int?,
      json['gender'] as int?,
      json['email'] as String?,
      json['fullName'] as String?,
      json['birthDay'] as String?,
      json['authProvider'] as bool?,
      json['roleDTO'] == null
          ? null
          : RoleDTO.fromJson(json['roleDTO'] as Map<String, dynamic>),
      json['statusDTO'] as bool?,
    );

Map<String, dynamic> _$ChangeInformationResponseToJson(
        ChangeInformationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'email': instance.email,
      'fullName': instance.fullName,
      'birthDay': instance.birthday,
      'authProvider': instance.authProvider,
      'roleDTO': instance.roleDTO,
      'statusDTO': instance.statusDTO,
    };
