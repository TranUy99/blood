// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductDTO _$OrderProductDTOFromJson(Map<String, dynamic> json) =>
    OrderProductDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      memory: json['memory'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      seri: json['seri'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OrderProductDTOToJson(OrderProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'memory': instance.memory,
      'color': instance.color,
      'seri': instance.seri,
      'image': instance.image,
    };
