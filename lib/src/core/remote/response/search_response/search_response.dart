import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/product.dart';
part 'search_response.g.dart';

//Receive contents, totalPages, totalItems, limit, no, first, last from api
@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'contents')
  final List<ProductDTO>? contents;

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

  SearchResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last,);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
