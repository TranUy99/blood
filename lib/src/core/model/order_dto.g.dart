// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) => OrderDTO(
      id: json['id'] as int?,
      total: (json['total'] as num?)?.toDouble(),
      receiveDate: json['receiveDate'] as String?,
      paymentStatus: json['paymentStatus'] as bool?,
      paymentMethodDTO: json['paymentMethodDTO'] == null
          ? null
          : Pay.fromJson(json['paymentMethodDTO'] as Map<String, dynamic>),
      userDTO: json['userDTO'] == null
          ? null
          : UserDTO.fromJson(json['userDTO'] as Map<String, dynamic>),
      statusDTO: json['statusDTO'] == null
          ? null
          : StatusDTO.fromJson(json['statusDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'receiveDate': instance.receiveDate,
      'paymentStatus': instance.paymentStatus,
      'paymentMethodDTO': instance.paymentMethodDTO,
      'userDTO': instance.userDTO,
      'statusDTO': instance.statusDTO,
    };
