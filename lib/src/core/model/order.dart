import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/order_product.dart';
import 'package:mobile_store/src/core/model/status_dto.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'idUser')
  final int? idUser;

  @JsonKey(name: 'idPromotion')
  final int? idPromotion;

  @JsonKey(name: 'paymentMethodDTO')
  final String? paymentMethodDTO;

  @JsonKey(name: 'statusDTO')
  final StatusDTO? statusDTO;

  @JsonKey(name: 'orderProductDTOList')
  final OrderProduct? orderProductDTOList;

  Order(
      {this.idUser,
      this.idPromotion,
      this.orderProductDTOList,
      this.paymentMethodDTO,
      this.statusDTO});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
