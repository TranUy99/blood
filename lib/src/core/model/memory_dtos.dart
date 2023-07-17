import 'package:json_annotation/json_annotation.dart';
part 'memory_dtos.g.dart';

@JsonSerializable()
class MemoryDTOs {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  MemoryDTOs({this.id, this.name,});
  factory MemoryDTOs.fromJson(Map<String, dynamic> json) => _$MemoryDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryDTOsToJson(this);
}
