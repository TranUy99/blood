import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/status_dto.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'total')
  final double? total;

  @JsonKey(name: 'receiveDate')
  final String? receiveDate;

  @JsonKey(name: 'statusDTO')
  final StatusDTO? statusDTO;

  @JsonKey(name: 'productOrderDTO')
  final OrderProductDTO? productOrderDTO;
  @JsonKey(name: 'quantity')
  final int? quantity;
  Order(
      {this.id, this.total, this.productOrderDTO, this.receiveDate, this.quantity,
      this.statusDTO});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
