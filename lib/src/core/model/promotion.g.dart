// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionDTO _$PromotionDTOFromJson(Map<String, dynamic> json) => PromotionDTO(
      id: json['id'] as int?,
      campagnDTO: json['campagnDTO'] as bool?,
      discountCodeDTO: json['discountCodeDTO'] as String?,
      discountDTO: json['discountDTO'] as int?,
      expireDateDTO: json['expireDateDTO'] as String?,
      maxGetDTO: (json['maxGetDTO'] as num?)?.toDouble(),
      statusDTO: json['statusDTO'] as bool?,
      totalPurchaseDTO: (json['totalPurchaseDTO'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PromotionDTOToJson(PromotionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discountCodeDTO': instance.discountCodeDTO,
      'totalPurchaseDTO': instance.totalPurchaseDTO,
      'discountDTO': instance.discountDTO,
      'maxGetDTO': instance.maxGetDTO,
      'expireDateDTO': instance.expireDateDTO,
      'campagnDTO': instance.campagnDTO,
      'statusDTO': instance.statusDTO,
    };
