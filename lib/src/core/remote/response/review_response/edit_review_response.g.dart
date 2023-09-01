// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditReviewResponse _$EditReviewResponseFromJson(Map<String, dynamic> json) =>
    EditReviewResponse(
      json['user_name'] as String?,
      json['product_id'] as int?,
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$EditReviewResponseToJson(EditReviewResponse instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'product_id': instance.productID,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
    };
