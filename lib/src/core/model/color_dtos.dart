import 'package:json_annotation/json_annotation.dart';
part 'color_dtos.g.dart';

@JsonSerializable()
class ColorDTOs {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  ColorDTOs({this.id, this.name,});
  factory ColorDTOs.fromJson(Map<String, dynamic> json) => _$ColorDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDTOsToJson(this);
}
