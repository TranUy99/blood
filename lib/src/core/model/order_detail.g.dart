// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['id'] as int?,
      userDTO: json['userDTO'] == null
          ? null
          : UserDTO.fromJson(json['userDTO'] as Map<String, dynamic>),
      statusDTO: json['statusDTO'] == null
          ? null
          : StatusDTO.fromJson(json['statusDTO'] as Map<String, dynamic>),
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

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'id': instance.id,
      'orderDTO': instance.orderDTO,
      'quantity': instance.quantity,
      'address': instance.address,
      'orderProductDTOList': instance.orderProductDTOList,
      'userDTO': instance.userDTO,
      'statusDTO': instance.statusDTO,
    };
