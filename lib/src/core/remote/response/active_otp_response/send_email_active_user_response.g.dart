// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_active_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailActiveUserResponse _$SendEmailActiveUserResponseFromJson(
        Map<String, dynamic> json) =>
    SendEmailActiveUserResponse(
      json['message'] as String?,
      json['errors'] as String?,
      json['path'] as String?,
      json['httpCode'] as int?,
    );

Map<String, dynamic> _$SendEmailActiveUserResponseToJson(
        SendEmailActiveUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
      'path': instance.path,
      'httpCode': instance.httpCode,
    };
