// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      json['idUser'] as int?,
      json['idPromotion'] as int?,
      json['paymentMethodDTO'] as String?,
      json['statusDTO'] == null
          ? null
          : StatusDTO.fromJson(json['statusDTO'] as Map<String, dynamic>),
      (json['orderProductDTOList'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : OrderProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['idAddress'] as int?,
      json['receiveDate'] as String?,
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'idUser': instance.idUser,
      'idPromotion': instance.idPromotion,
      'paymentMethodDTO': instance.paymentMethodDTO,
      'statusDTO': instance.statusDTO,
      'orderProductDTOList': instance.orderProductDTOList,
      'idAddress': instance.idAddress,
      'receiveDate': instance.receiveDate,
    };
