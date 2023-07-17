import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/technical_dto.dart';
part 'product_tech_dtos.g.dart';

@JsonSerializable()
class ProductTechDTOs {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'technicalDTO')
  final TechnicalDTO? technicalDTO;
  @JsonKey(name: 'info')
  final String? info;
  @JsonKey(name: 'primary')
  final bool? primary;
  
  ProductTechDTOs({this.id, this.technicalDTO,this.info,this.primary});
  factory ProductTechDTOs.fromJson(Map<String, dynamic> json) => _$ProductTechDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTechDTOsToJson(this);
}

