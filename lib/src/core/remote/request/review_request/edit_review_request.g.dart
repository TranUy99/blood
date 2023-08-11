// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditReviewRequest _$EditReviewRequestFromJson(Map<String, dynamic> json) =>
    EditReviewRequest(
      json['comment'] as String?,
      json['rating'] as int?,
      json['status'] as bool?,
    );

Map<String, dynamic> _$EditReviewRequestToJson(EditReviewRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
    };
