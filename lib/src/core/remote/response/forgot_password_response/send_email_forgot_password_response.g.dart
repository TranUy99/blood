// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailForgotPasswordResponse _$SendEmailForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    SendEmailForgotPasswordResponse(
      json['message'] as String?,
      json['path'] as String?,
      json['httpCode'] as int?,
    );

Map<String, dynamic> _$SendEmailForgotPasswordResponseToJson(
        SendEmailForgotPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'path': instance.path,
      'httpCode': instance.httpCode,
    };
