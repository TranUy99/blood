import 'package:json_annotation/json_annotation.dart';

part 'create_address_response.g.dart';

//Receive message from api
@JsonSerializable()
class CreateAddressResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'path')
  final String? path;

  CreateAddressResponse(this.message, this.path);

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAddressResponseToJson(this);
}
