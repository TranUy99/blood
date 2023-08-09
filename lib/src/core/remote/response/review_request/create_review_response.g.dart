// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReviewResponse _$CreateReviewResponseFromJson(
        Map<String, dynamic> json) =>
    CreateReviewResponse(
      json['httpCode'] as int?,
      json['message'] as String?,
      json['errors'] as String?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$CreateReviewResponseToJson(
        CreateReviewResponse instance) =>
    <String, dynamic>{
      'httpCode': instance.httpCode,
      'message': instance.message,
      'errors': instance.errors,
      'status': instance.status,
    };
