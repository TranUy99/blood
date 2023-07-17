import 'package:json_annotation/json_annotation.dart';
part 'categories_dto.g.dart';

@JsonSerializable()
class CategoriesDTO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  
  CategoriesDTO({this.id, this.name,});
  factory CategoriesDTO.fromJson(Map<String, dynamic> json) => _$CategoriesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDTOToJson(this);
}

