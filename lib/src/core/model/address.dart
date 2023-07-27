import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address {
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

  Address({this.defaults,this.location,this.nameReceiver,this.phoneReceiver,this.type});
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

