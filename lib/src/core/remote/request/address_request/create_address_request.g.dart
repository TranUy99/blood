// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressRequest _$CreateAddressRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAddressRequest(
      location: json['location'] as String?,
      type: json['type'] as String?,
      nameReceiver: json['nameReceiver'] as String?,
      phoneReceiver: json['phoneReceiver'] as String?,
    );

Map<String, dynamic> _$CreateAddressRequestToJson(
        CreateAddressRequest instance) =>
    <String, dynamic>{
      'location': instance.location,
      'type': instance.type,
      'phoneReceiver': instance.phoneReceiver,
      'nameReceiver': instance.nameReceiver,
    };
