// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['error'] as String?,
      role: json['role'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      type: json['type'] as String?,
      email: json['email'] as String?,
      idUser: json['idUser'] as int?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'idUser': instance.idUser,
      'type': instance.type,
      'message': instance.message,
      'error': instance.error,
      'email': instance.email,
      'role': instance.role,
    };
