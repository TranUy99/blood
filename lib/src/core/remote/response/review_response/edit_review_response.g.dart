// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditReviewResponse _$EditReviewResponseFromJson(Map<String, dynamic> json) =>
    EditReviewResponse(
      json['id'] as int?,
      json['user_id'] as int?,
      json['product_id'] as int?,
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
      json['errors'] as String?,
    );

Map<String, dynamic> _$EditReviewResponseToJson(EditReviewResponse instance) =>
    <String, dynamic>{
      'id': instance.reviewID,
      'user_id': instance.userID,
      'product_id': instance.productID,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
      'errors': instance.errors,
    };
