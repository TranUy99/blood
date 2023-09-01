
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/model/manufacturer_dto.dart';
import 'package:mobile_store/src/core/model/product_tech_dtos.dart';
import 'package:mobile_store/src/core/model/review_dtos.dart';
import 'package:mobile_store/src/core/model/seri_dtos.dart';

import 'color_dtos.dart';
import 'image_dtos.dart';
import 'memory_dtos.dart';

part 'product_filter.g.dart';

@JsonSerializable()
class ProductFilter {
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
  final double? price;

  @JsonKey(name: 'stocks')
  final int? stocks;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'views')
  final int? views;

  @JsonKey(name: 'productTechDTOs')
  final List<ProductTechDTOs>? productTechDTOs;

  @JsonKey(name: 'seriDTOs')
  final List<SeriDTOs>? seriDTOs;

  @JsonKey(name: 'colorDTOs')
  final List<ColorDTOs>? colorDTOs;

  @JsonKey(name: 'memoryDTOs')
  final List<MemoryDTOs>? memoryDTOs;

  @JsonKey(name: 'reviewDTOs')
  final List<ReviewDTOs>? reviewDTOs;

  @JsonKey(name: 'imageDTOs')
  final List<ImageDTOs>? imageDTOs;

  ProductFilter(
      this.id,
      this.categoriesDTO,
      this.manufacturerDTO,
      this.name,
      this.description,
      this.price,
      this.stocks,
      this.status,
      this.views,
      this.productTechDTOs,
      this.seriDTOs,
      this.colorDTOs,
      this.memoryDTOs,
      this.reviewDTOs,
      this.imageDTOs);

  factory ProductFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterToJson(this);
}
