import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_store/src/core/model/manufacturer_dto.dart';

part 'manufacturer_items_response.g.dart';

@JsonSerializable()
class ManufacturerItemsResponse {
  @JsonKey(name: 'contents')
  final List<ManufacturerDTO>? contents;

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

  ManufacturerItemsResponse(this.contents, this.totalPages, this.totalItems,
      this.limit, this.no, this.first, this.last,);

  factory ManufacturerItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerItemsResponseToJson(this);
}