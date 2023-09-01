// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map<String, dynamic> json) => Ward(
      ward_id: json['ward_id'] as String?,
      ward_name: json['ward_name'] as String?,
      districtDTO: json['districtDTO'] == null
          ? null
          : District.fromJson(json['districtDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'ward_id': instance.ward_id,
      'ward_name': instance.ward_name,
      'districtDTO': instance.districtDTO,
    };
