// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      imageDTOs: json['imageDTOs'] == null
          ? null
          : ImageDTOs.fromJson(json['imageDTOs'] as Map<String, dynamic>),
      categoriesDTO: json['categoriesDTO'] == null
          ? null
          : CategoriesDTO.fromJson(
              json['categoriesDTO'] as Map<String, dynamic>),
      colorDTOs: json['colorDTOs'] == null
          ? null
          : ColorDTOs.fromJson(json['colorDTOs'] as Map<String, dynamic>),
      description: json['description'] as String?,
      manufacturerDTO: json['manufacturerDTO'] == null
          ? null
          : ManufacturerDTO.fromJson(
              json['manufacturerDTO'] as Map<String, dynamic>),
      productTechDTOs: json['productTechDTOs'] == null
          ? null
          : ProductTechDTOs.fromJson(
              json['productTechDTOs'] as Map<String, dynamic>),
      reviewDTOs: json['reviewDTOs'] as String?,
      seriDTOs: json['seriDTOs'] == null
          ? null
          : SeriDTOs.fromJson(json['seriDTOs'] as Map<String, dynamic>),
      status: json['status'] as bool?,
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
      'views': instance.views,
      'productTechDTOs': instance.productTechDTOs,
      'seriDTOs': instance.seriDTOs,
      'colorDTOs': instance.colorDTOs,
      'reviewDTOs': instance.reviewDTOs,
      'imageDTOs': instance.imageDTOs,
    };
