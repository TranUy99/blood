// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      email: json['email'] as String?,
      birthDay: json['birthDay'] as String?,
      fullName: json['fullName'] as String?,
      authProvider: json['authProvider'] as String?,
      statusDTO: json['statusDTO'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'birthDay': instance.birthDay,
      'authProvider': instance.authProvider,
      'statusDTO': instance.statusDTO,
      'message': instance.message,
    };
