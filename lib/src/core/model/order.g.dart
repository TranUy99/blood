// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      idUser: json['idUser'] as int?,
      idPromotion: json['idPromotion'] as int?,
      orderProductDTOList: json['orderProductDTOList'] == null
          ? null
          : OrderProduct.fromJson(
              json['orderProductDTOList'] as Map<String, dynamic>),
      paymentMethodDTO: json['paymentMethodDTO'] as String?,
      statusDTO: json['statusDTO'] == null
          ? null
          : StatusDTO.fromJson(json['statusDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'idUser': instance.idUser,
      'idPromotion': instance.idPromotion,
      'paymentMethodDTO': instance.paymentMethodDTO,
      'statusDTO': instance.statusDTO,
      'orderProductDTOList': instance.orderProductDTOList,
    };
