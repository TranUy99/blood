import 'package:json_annotation/json_annotation.dart';

part 'pay.g.dart';

@JsonSerializable()
class Pay {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  Pay({
    this.id,
    this.name,
  });
  factory Pay.fromJson(Map<String, dynamic> json) => _$PayFromJson(json);

  Map<String, dynamic> toJson() => _$PayToJson(this);
}
