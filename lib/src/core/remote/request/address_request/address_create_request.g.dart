// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressCreateRequest _$AddressCreateRequestFromJson(
        Map<String, dynamic> json) =>
    AddressCreateRequest(
      location: json['location'] as String?,
      type: json['type'] as String?,
      nameReceiver: json['nameReceiver'] as String?,
      phoneReceiver: json['phoneReceiver'] as String?,
    );

Map<String, dynamic> _$AddressCreateRequestToJson(
        AddressCreateRequest instance) =>
    <String, dynamic>{
      'location': instance.location,
      'type': instance.type,
      'phoneReceiver': instance.phoneReceiver,
      'nameReceiver': instance.nameReceiver,
    };
