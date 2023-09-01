// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_information_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeInformationRequest _$ChangeInformationRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeInformationRequest(
      json['email'] as String?,
      json['fullName'] as String?,
      json['gender'] as int?,
      json['birthDay'] as String?,
    );

Map<String, dynamic> _$ChangeInformationRequestToJson(
        ChangeInformationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
    };
