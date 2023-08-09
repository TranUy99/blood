import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/status_dto.dart';
import 'package:mobile_store/src/core/model/user.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDTO {
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

  @JsonKey(name: 'userDTO')
  final UserDTO? userDTO;

  @JsonKey(name: 'statusDTO')
  final StatusDTO? statusDTO;

  OrderDTO(
      {this.id,
      this.userDTO,
      this.statusDTO,
      this.address,
      this.orderDTO,
      this.orderProductDTOList,
      this.quantity});
  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}
