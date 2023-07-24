// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilterResponse _$ProductFilterResponseFromJson(
        Map<String, dynamic> json) =>
    ProductFilterResponse(
      (json['contents'] as List<dynamic>?)
          ?.map((e) => ProductFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int?,
      json['totalItems'] as int?,
      json['limit'] as int?,
      json['no'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
    );

Map<String, dynamic> _$ProductFilterResponseToJson(
        ProductFilterResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
      'no': instance.no,
      'first': instance.first,
      'last': instance.last,
    };
