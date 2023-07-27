import 'package:json_annotation/json_annotation.dart';

part 'create_address_request.g.dart';

@JsonSerializable()
class CreateAddressRequest {
  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'phoneReceiver')
  final String? phoneReceiver;

  @JsonKey(name: 'nameReceiver')
  final String? nameReceiver;
  CreateAddressRequest({
    this.location,
    this.type,
    this.nameReceiver,
    this.phoneReceiver,
  });

  factory CreateAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAddressRequestToJson(this);
}
