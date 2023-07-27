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
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'location': instance.location,
      'type': instance.type,
      'phoneReceiver': instance.phoneReceiver,
      'nameReceiver': instance.nameReceiver,
      'defaults': instance.defaults,
    };
