import 'package:json_annotation/json_annotation.dart';

part 'address_create_request.g.dart';

@JsonSerializable()
class AddressCreateRequest {
  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'phoneReceiver')
  final String? phoneReceiver;

  @JsonKey(name: 'nameReceiver')
  final String? nameReceiver;
  AddressCreateRequest({
    this.location,
    this.type,
    this.nameReceiver,
    this.phoneReceiver,
  });

  factory AddressCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressCreateRequestToJson(this);
}
