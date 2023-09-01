// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      district_id: json['district_id'] as String?,
      district_name: json['district_name'] as String?,
      provinceDTO: json['provinceDTO'] == null
          ? null
          : Province.fromJson(json['provinceDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'district_id': instance.district_id,
      'district_name': instance.district_name,
      'provinceDTO': instance.provinceDTO,
    };
