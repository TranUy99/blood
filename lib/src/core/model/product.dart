import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/model/color_dtos.dart';
import 'package:mobile_store/src/core/model/image_dtos.dart';
import 'package:mobile_store/src/core/model/manufacturer_dto.dart';
import 'package:mobile_store/src/core/model/product_tech_dtos.dart';
import 'package:mobile_store/src/core/model/seri_dtos.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'categoriesDTO')
  final CategoriesDTO? categoriesDTO;

  @JsonKey(name: 'manufacturerDTO')
  final ManufacturerDTO? manufacturerDTO;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'price')
  final int? price;

  @JsonKey(name: 'stocks')
  final int? stocks;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'views')
  final int? views;

  @JsonKey(name: 'productTechDTOs')
  final ProductTechDTOs? productTechDTOs;

  @JsonKey(name: 'seriDTOs')
  final SeriDTOs? seriDTOs;

  @JsonKey(name: 'colorDTOs')
  final ColorDTOs? colorDTOs;

  @JsonKey(name: 'reviewDTOs')
  final String? reviewDTOs;

  @JsonKey(name: 'imageDTOs')
  final ImageDTOs? imageDTOs;

  ProductDTO(
      {this.id,
      this.name,
      this.price,
      this.imageDTOs,
      this.categoriesDTO,
      this.colorDTOs,
      this.description,
      this.manufacturerDTO,
      this.productTechDTOs,
      this.reviewDTOs,
      this.seriDTOs,
      this.status,
      this.stocks,
      this.views});
  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}
