import 'package:json_annotation/json_annotation.dart';
part 'technical_dto.g.dart';

@JsonSerializable()
class TechnicalDTO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  TechnicalDTO({this.id, this.name,});
  factory TechnicalDTO.fromJson(Map<String, dynamic> json) => _$TechnicalDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicalDTOToJson(this);
}
