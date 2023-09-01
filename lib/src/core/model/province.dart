import 'package:json_annotation/json_annotation.dart';
part 'province.g.dart';

@JsonSerializable()
class Province {
  @JsonKey(name: 'province_id')
  final String? province_id;

  @JsonKey(name: 'province_name')
  final String? province_name;

  Province({
    this.province_id,
    this.province_name,

  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}

