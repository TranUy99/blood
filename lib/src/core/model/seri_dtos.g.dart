// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriDTOs _$SeriDTOsFromJson(Map<String, dynamic> json) => SeriDTOs(
      id: json['id'] as int?,
      name: json['name'] as String?,
      productOrderDTO: json['productOrderDTO'] as String?,
    );

Map<String, dynamic> _$SeriDTOsToJson(SeriDTOs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productOrderDTO': instance.productOrderDTO,
    };
