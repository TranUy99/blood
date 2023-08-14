import 'package:json_annotation/json_annotation.dart';
part 'order_product_dto.g.dart';

@JsonSerializable()
class OrderProductDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'price')
  final double? price;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'memory')
  final String? memory;

  @JsonKey(name: 'color')
  final String? color;

  @JsonKey(name: 'seri')
  final String? seri;

  @JsonKey(name: 'image')
  final String? image;
  OrderProductDTO(
      {this.id,
      this.name,
      this.color,
      this.description,
      this.memory,
      this.price,
      this.seri,
      this.image});
  factory OrderProductDTO.fromJson(Map<String, dynamic> json) => _$OrderProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductDTOToJson(this);
}
