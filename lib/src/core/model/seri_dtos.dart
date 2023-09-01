import 'package:json_annotation/json_annotation.dart';
part 'seri_dtos.g.dart';

@JsonSerializable()
class SeriDTOs {
  @JsonKey(name: 'id')
  final int? id; 
  @JsonKey(name: 'name')
  final String? name;
    @JsonKey(name: 'productOrderDTO')
  final String? productOrderDTO;
  
  SeriDTOs({this.id, this.name,this.productOrderDTO});
  factory SeriDTOs.fromJson(Map<String, dynamic> json) => _$SeriDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$SeriDTOsToJson(this);
}

