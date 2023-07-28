import 'package:json_annotation/json_annotation.dart';
part 'status_dto.g.dart';

@JsonSerializable()
class StatusDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  StatusDTO({
    this.id,
    this.name,
  });
  factory StatusDTO.fromJson(Map<String, dynamic> json) => _$StatusDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StatusDTOToJson(this);
}
