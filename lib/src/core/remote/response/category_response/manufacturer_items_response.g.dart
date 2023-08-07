// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturerItemsResponse _$ManufacturerItemsResponseFromJson(
        Map<String, dynamic> json) =>
    ManufacturerItemsResponse(
      (json['contents'] as List<dynamic>?)
          ?.map((e) => ManufacturerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int?,
      json['totalItems'] as int?,
      json['limit'] as int?,
      json['no'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
    );

Map<String, dynamic> _$ManufacturerItemsResponseToJson(
        ManufacturerItemsResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
      'no': instance.no,
      'first': instance.first,
      'last': instance.last,
    };
