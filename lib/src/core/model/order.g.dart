// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int?,
      total: (json['total'] as num?)?.toDouble(),
      productOrderDTO: json['productOrderDTO'] == null
          ? null
          : OrderProductDTO.fromJson(
              json['productOrderDTO'] as Map<String, dynamic>),
      receiveDate: json['receiveDate'] as String?,
      quantity: json['quantity'] as int?,
      statusDTO: json['statusDTO'] == null
          ? null
          : StatusDTO.fromJson(json['statusDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'receiveDate': instance.receiveDate,
      'statusDTO': instance.statusDTO,
      'productOrderDTO': instance.productOrderDTO,
      'quantity': instance.quantity,
    };
