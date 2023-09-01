import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/order_dto.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetailDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'orderDTO')
  final OrderDTO? orderDTO;

  @JsonKey(name: 'quantity')
  final int? quantity;

  @JsonKey(name: 'address')
  final Address? address;

  @JsonKey(name: 'orderProductDTOList')
  final List<OrderProductDTO>? orderProductDTOList;



  OrderDetailDTO(
      {this.id,
      this.address,
      this.orderDTO,
      this.orderProductDTOList,
      this.quantity});
  factory OrderDetailDTO.fromJson(Map<String, dynamic> json) => _$OrderDetailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailDTOToJson(this);
}
