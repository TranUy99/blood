import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/categories_dto.dart';

part 'category_items_response.g.dart';

@JsonSerializable()
class CategoryItemsResponse {
  @JsonKey(name: 'contents')
  final List<CategoriesDTO>? contents;

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

  CategoryItemsResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last,);

  factory CategoryItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemsResponseToJson(this);
}