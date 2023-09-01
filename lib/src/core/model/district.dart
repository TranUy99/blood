import 'package:json_annotation/json_annotation.dart';

import 'province.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  District({
    this.district_id,
    this.district_name,
    this.provinceDTO,
  });
  @JsonKey(name: 'district_id')
  final String? district_id;

  @JsonKey(name: 'district_name')
  final String? district_name;

  @JsonKey(name: 'provinceDTO')
  final Province? provinceDTO;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}

