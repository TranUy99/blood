import 'package:json_annotation/json_annotation.dart';
part 'image_dtos.g.dart';

@JsonSerializable()
class ImageDTOs {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  ImageDTOs({this.id, this.name,});
  factory ImageDTOs.fromJson(Map<String, dynamic> json) => _$ImageDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDTOsToJson(this);
}

