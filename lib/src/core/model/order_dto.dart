import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/pay.dart';
import 'package:mobile_store/src/core/model/status_dto.dart';
import 'package:mobile_store/src/core/model/user.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDTO {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'total')
  final double? total;

  @JsonKey(name: 'receiveDate')
  final String? receiveDate;

  @JsonKey(name: 'paymentStatus')
  final bool? paymentStatus;

  @JsonKey(name: 'paymentMethodDTO')
  final Pay? paymentMethodDTO;

  @JsonKey(name: 'userDTO')
  final UserDTO? userDTO;

  @JsonKey(name: 'statusDTO')
  final StatusDTO? statusDTO;

  OrderDTO(
      {this.id,
      this.total,
      this.receiveDate,
      this.paymentStatus,
      this.paymentMethodDTO,
      this.userDTO,
      this.statusDTO});
  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}
