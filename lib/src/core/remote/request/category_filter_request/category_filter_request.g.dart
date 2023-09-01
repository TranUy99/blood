// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFilterRequest _$CategoryFilterRequestFromJson(
        Map<String, dynamic> json) =>
    CategoryFilterRequest(
      json['manufactureId'] as int?,
      json['categoryId'] as int?,
      json['keyword'] as String?,
      json['lowerPrice'] as int?,
      json['higherPrice'] as int?,
    );

Map<String, dynamic> _$CategoryFilterRequestToJson(
        CategoryFilterRequest instance) =>
    <String, dynamic>{
      'manufactureId': instance.manufactureId,
      'categoryId': instance.categoryId,
      'keyword': instance.keyword,
      'lowerPrice': instance.lowerPrice,
      'higherPrice': instance.higherPrice,
    };
