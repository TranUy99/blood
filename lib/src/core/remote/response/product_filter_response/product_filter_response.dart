import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/product_filter.dart';

part 'product_filter_response.g.dart';

//Receive contents, totalPages, totalItems, limit, no, first, last from api
@JsonSerializable()
class ProductFilterResponse {
  @JsonKey(name: 'contents')
  final List<ProductFilter>? contents;

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

  ProductFilterResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last);

  factory ProductFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterResponseToJson(this);
}
