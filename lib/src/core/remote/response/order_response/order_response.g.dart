// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      (json['contents'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPages'] as int?,
      json['totalItems'] as int?,
      json['limit'] as int?,
      json['no'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
      'no': instance.no,
      'first': instance.first,
      'last': instance.last,
    };
