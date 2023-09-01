// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditReviewRequest _$EditReviewRequestFromJson(Map<String, dynamic> json) =>
    EditReviewRequest(
      json['user_name'] as String?,
      json['product_id'] as int?,
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$EditReviewRequestToJson(EditReviewRequest instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'product_id': instance.productId,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
    };
