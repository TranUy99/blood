// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_change_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressChangeRequest _$AddressChangeRequestFromJson(
        Map<String, dynamic> json) =>
    AddressChangeRequest(
      location: json['location'] as String?,
      type: json['type'] as String?,
      nameReceiver: json['nameReceiver'] as String?,
      phoneReceiver: json['phoneReceiver'] as String?,
      defaults: json['defaults'] as bool?,
    );

Map<String, dynamic> _$AddressChangeRequestToJson(
        AddressChangeRequest instance) =>
    <String, dynamic>{
      'location': instance.location,
      'type': instance.type,
      'phoneReceiver': instance.phoneReceiver,
      'nameReceiver': instance.nameReceiver,
      'defaults': instance.defaults,
    };
