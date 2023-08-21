// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDTOs _$ReviewDTOsFromJson(Map<String, dynamic> json) => ReviewDTOs(
      json['id'] as int?,
      json['user_name'] as String?,
      json['product_id'] as int?,
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$ReviewDTOsToJson(ReviewDTOs instance) =>
    <String, dynamic>{
      'id': instance.reviewID,
      'user_name': instance.userName,
      'product_id': instance.productID,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
    };
