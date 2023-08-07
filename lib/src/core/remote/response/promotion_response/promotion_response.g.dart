// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionResponse _$PromotionResponseFromJson(Map<String, dynamic> json) =>
    PromotionResponse(
      (json['contents'] as List<dynamic>?)
          ?.map((e) => PromotionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int?,
      json['totalItems'] as int?,
      json['limit'] as int?,
      json['no'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
    );

Map<String, dynamic> _$PromotionResponseToJson(PromotionResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
      'no': instance.no,
      'first': instance.first,
      'last': instance.last,
    };
