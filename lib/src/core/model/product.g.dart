// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imageDTOs: (json['imageDTOs'] as List<dynamic>?)
          ?.map((e) => ImageDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriesDTO: json['categoriesDTO'] == null
          ? null
          : CategoriesDTO.fromJson(
              json['categoriesDTO'] as Map<String, dynamic>),
      colorDTOs: (json['colorDTOs'] as List<dynamic>?)
          ?.map((e) => ColorDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      manufacturerDTO: json['manufacturerDTO'] == null
          ? null
          : ManufacturerDTO.fromJson(
              json['manufacturerDTO'] as Map<String, dynamic>),
      productTechDTOs: (json['productTechDTOs'] as List<dynamic>?)
          ?.map((e) => ProductTechDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      memoryDTOs: (json['memoryDTOs'] as List<dynamic>?)
          ?.map((e) => MemoryDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      seriDTOs: (json['seriDTOs'] as List<dynamic>?)
          ?.map((e) => SeriDTOs.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      star: (json['star'] as num?)?.toDouble(),
      stocks: json['stocks'] as int?,
      views: json['views'] as int?,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoriesDTO': instance.categoriesDTO,
      'manufacturerDTO': instance.manufacturerDTO,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stocks': instance.stocks,
      'status': instance.status,
      'star': instance.star,
      'views': instance.views,
      'productTechDTOs': instance.productTechDTOs,
      'seriDTOs': instance.seriDTOs,
      'colorDTOs': instance.colorDTOs,
      'memoryDTOs': instance.memoryDTOs,
      'imageDTOs': instance.imageDTOs,
    };
