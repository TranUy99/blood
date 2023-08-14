import 'package:json_annotation/json_annotation.dart';

import '../../../model/order.dart';
part 'order_response.g.dart';

//Receive contents, totalPages, totalItems, limit, no, first, last from api
@JsonSerializable()
class OrderResponse {
  @JsonKey(name: 'contents')
  final List<Order>? contents;

  @JsonKey(name: 'totalPages')
  final int? totalPages;

  @JsonKey(name: 'totalItems')
  final int? totalItems;

  @JsonKey(name: 'limit')
  final int? limit;

  @JsonKey(name: 'no')
  final int? no;

  @JsonKey(name: 'first')
  final bool? first;

  @JsonKey(name: 'last')
  final bool? last;

  OrderResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last,);

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
