// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReviewRequest _$CreateReviewRequestFromJson(Map<String, dynamic> json) =>
    CreateReviewRequest(
      json['user_name'] as String?,
      json['product_id'] as int?,
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$CreateReviewRequestToJson(
        CreateReviewRequest instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'product_id': instance.productId,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
    };
