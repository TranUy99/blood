// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailDTO _$OrderDetailDTOFromJson(Map<String, dynamic> json) =>
    OrderDetailDTO(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      orderDTO: json['orderDTO'] == null
          ? null
          : OrderDTO.fromJson(json['orderDTO'] as Map<String, dynamic>),
      orderProductDTOList: (json['orderProductDTOList'] as List<dynamic>?)
          ?.map((e) => OrderProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$OrderDetailDTOToJson(OrderDetailDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDTO': instance.orderDTO,
      'quantity': instance.quantity,
      'address': instance.address,
      'orderProductDTOList': instance.orderProductDTOList,
    };
