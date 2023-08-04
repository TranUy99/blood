import 'package:json_annotation/json_annotation.dart';
part 'order_product.g.dart';

@JsonSerializable()
class OrderProduct {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'price')
  final int? price;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'memory')
  final String? memory;

  @JsonKey(name: 'color')
  final String? color;

  @JsonKey(name: 'seri')
  final String? seri;

  OrderProduct(
      {this.id, this.name, this.color, this.description, this.memory, this.price, this.seri});
  factory OrderProduct.fromJson(Map<String, dynamic> json) => _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}
