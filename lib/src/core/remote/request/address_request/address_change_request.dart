import 'package:json_annotation/json_annotation.dart';

part 'address_change_request.g.dart';

@JsonSerializable()
class AddressChangeRequest {
  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'phoneReceiver')
  final String? phoneReceiver;

  @JsonKey(name: 'nameReceiver')
  final String? nameReceiver;

    @JsonKey(name: 'defaults')
  final bool? defaults;
  AddressChangeRequest({
    this.location,
    this.type,
    this.nameReceiver,
    this.phoneReceiver,
    this.defaults  });

  factory AddressChangeRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressChangeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressChangeRequestToJson(this);
}
