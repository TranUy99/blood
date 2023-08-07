import 'package:json_annotation/json_annotation.dart';
part 'manufacturer_dto.g.dart';

@JsonSerializable()
class ManufacturerDTO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  ManufacturerDTO({this.id, this.name,});
  factory ManufacturerDTO.fromJson(Map<String, dynamic> json) => _$ManufacturerDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerDTOToJson(this);
}

