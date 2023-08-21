import 'package:json_annotation/json_annotation.dart';

part 'review_dtos.g.dart';

@JsonSerializable()
class ReviewDTOs {
  @JsonKey(name: 'id')
  final int? reviewID;

  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'product_id')
  final int? productID;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'rating')
  final int? rating;

  @JsonKey(name: 'status')
  final bool? status;

  ReviewDTOs(this.reviewID, this.userName, this.productID, this.comment,
      this.rating, this.status);

  factory ReviewDTOs.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDTOsToJson(this);
}
