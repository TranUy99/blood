// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) =>
    ProductFilter(
      json['id'] as int?,
      json['categoriesDTO'] == null
          ? null
          : CategoriesDTO.fromJson(
              json['categoriesDTO'] as Map<String, dynamic>),
      json['manufacturerDTO'] == null
          ? null
          : ManufacturerDTO.fromJson(
              json['manufacturerDTO'] as Map<String, dynamic>),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['stocks'] as int?,
      json['status'] as bool?,
      json['views'] as int?,
      (json['productTechDTOs'] as List<dynamic>?)
          ?.map((e) => ProductTechDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['seriDTOs'] as List<dynamic>?)
          ?.map((e) => SeriDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['colorDTOs'] as List<dynamic>?)
          ?.map((e) => ColorDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['memoryDTOs'] as List<dynamic>?)
          ?.map((e) => MemoryDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['reviewDTOs'] as List<dynamic>?)
          ?.map((e) => ReviewDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['imageDTOs'] as List<dynamic>?)
          ?.map((e) => ImageDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductFilterToJson(ProductFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoriesDTO': instance.categoriesDTO,
      'manufacturerDTO': instance.manufacturerDTO,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stocks': instance.stocks,
      'status': instance.status,
      'views': instance.views,
      'productTechDTOs': instance.productTechDTOs,
      'seriDTOs': instance.seriDTOs,
      'colorDTOs': instance.colorDTOs,
      'memoryDTOs': instance.memoryDTOs,
      'reviewDTOs': instance.reviewDTOs,
      'imageDTOs': instance.imageDTOs,
    };
