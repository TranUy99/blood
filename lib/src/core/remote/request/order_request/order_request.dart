import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/status_dto.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  @JsonKey(name: 'idUser')
  final int? idUser;

  @JsonKey(name: 'idPromotion')
  final int? idPromotion;

  @JsonKey(name: 'paymentMethodDTO')
  final String? paymentMethodDTO;

  @JsonKey(name: 'statusDTO')
  final StatusDTO? statusDTO;

  @JsonKey(name: 'orderProductDTOList')
  final List<OrderProductDTO?> orderProductDTOList;

  @JsonKey(name: 'idAddress')
  final int? idAddress;

  @JsonKey(name: 'receiveDate')
  final String? receiveDate;

  OrderRequest(this.idUser, this.idPromotion, this.paymentMethodDTO, this.statusDTO,
      this.orderProductDTOList, this.idAddress, this.receiveDate);

  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
