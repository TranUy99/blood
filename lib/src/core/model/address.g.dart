// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      defaults: json['defaults'] as bool?,
      location: json['location'] as String?,
      nameReceiver: json['nameReceiver'] as String?,
      phoneReceiver: json['phoneReceiver'] as String?,
      locationType: json['type'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'type': instance.locationType,
      'phoneReceiver': instance.phoneReceiver,
      'nameReceiver': instance.nameReceiver,
      'defaults': instance.defaults,
    };
