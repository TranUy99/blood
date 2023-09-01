// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tech_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTechDTOs _$ProductTechDTOsFromJson(Map<String, dynamic> json) =>
    ProductTechDTOs(
      id: json['id'] as int?,
      technicalDTO: json['technicalDTO'] == null
          ? null
          : TechnicalDTO.fromJson(json['technicalDTO'] as Map<String, dynamic>),
      info: json['info'] as String?,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$ProductTechDTOsToJson(ProductTechDTOs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'technicalDTO': instance.technicalDTO,
      'info': instance.info,
      'primary': instance.primary,
    };
