import 'package:json_annotation/json_annotation.dart';

part 'category_filter_request.g.dart';

@JsonSerializable()
class CategoryFilterRequest {
  @JsonKey(name: 'manufactureId')
  final int? manufactureId;

  @JsonKey(name: 'categoryId')
  final int? categoryId;

  @JsonKey(name: 'keyword')
  final String? keyword;

  @JsonKey(name: 'lowerPrice')
  final int? lowerPrice;

  @JsonKey(name: 'higherPrice')
  final int? higherPrice;

  CategoryFilterRequest(this.manufactureId, this.categoryId, this.keyword, this.lowerPrice, this.higherPrice);

  factory CategoryFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryFilterRequestToJson(this);
}