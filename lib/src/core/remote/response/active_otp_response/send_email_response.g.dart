// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) =>
    SendEmailResponse(
      json['message'] as String?,
      json['errors'] as String?,
      json['path'] as String?,
      json['httpCode'] as int?,
    );

Map<String, dynamic> _$SendEmailResponseToJson(SendEmailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
      'path': instance.path,
      'httpCode': instance.httpCode,
    };
