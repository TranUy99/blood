import 'package:json_annotation/json_annotation.dart';

import 'package:mobile_store/src/core/model/promotion.dart';
part 'promotion_response.g.dart';

//Receive contents, totalPages, totalItems, limit, no, first, last from api
@JsonSerializable()
class PromotionResponse {
  @JsonKey(name: 'contents')
  final List<PromotionDTO>? contents;

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

  PromotionResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last,);

  factory PromotionResponse.fromJson(Map<String, dynamic> json) =>
      _$PromotionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionResponseToJson(this);
}
