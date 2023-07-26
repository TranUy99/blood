import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/district.dart';
part 'ward.g.dart';

@JsonSerializable()
class Ward {
  @JsonKey(name: 'ward_id')
  final String? ward_id;

  @JsonKey(name: 'ward_name')
  final String? ward_name;
  @JsonKey(name: 'districtDTO')
  final District? districtDTO;
  Ward({
    this.ward_id,
    this.ward_name,
    this.districtDTO,
  });

  factory Ward.fromJson(Map<String, dynamic> json) =>
      _$WardFromJson(json);

  Map<String, dynamic> toJson() => _$WardToJson(this);
}
