import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';

@JsonSerializable()
class RoleDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  RoleDTO(
    this.id,
    this.name,
);

  factory RoleDTO.fromJson(Map<String, dynamic> json) => _$RoleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RoleDTOToJson(this);
}