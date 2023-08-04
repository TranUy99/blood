// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      memory: json['memory'] as String?,
      price: json['price'] as int?,
      seri: json['seri'] as String?,
    );

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'memory': instance.memory,
      'color': instance.color,
      'seri': instance.seri,
    };
