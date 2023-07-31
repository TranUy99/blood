// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveOTPResponse _$ActiveOTPResponseFromJson(Map<String, dynamic> json) =>
    ActiveOTPResponse(
      json['message'] as String?,
      json['path'] as String?,
      json['errors'] as String?,
    );

Map<String, dynamic> _$ActiveOTPResponseToJson(ActiveOTPResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
      'path': instance.path,
    };
