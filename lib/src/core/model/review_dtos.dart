import 'package:json_annotation/json_annotation.dart';

part 'review_dtos.g.dart';

@JsonSerializable()
class ReviewDTOs {
  ReviewDTOs();

  factory ReviewDTOs.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDTOsToJson(this);
}
