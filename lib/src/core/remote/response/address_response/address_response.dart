import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

//Receive message from api
@JsonSerializable()
class AddressResponse {
  @JsonKey(name: 'message')
  final String? message;
    
  @JsonKey(name: 'path')
  final String? path;

  AddressResponse(this.message, this.path);

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}
