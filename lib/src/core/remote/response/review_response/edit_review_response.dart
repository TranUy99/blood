import 'package:json_annotation/json_annotation.dart';

part 'edit_review_response.g.dart';

@JsonSerializable()
class EditReviewResponse {
  @JsonKey(name: 'id')
  final int? reviewID;

  @JsonKey(name: 'user_id')
  final int? userID;

  @JsonKey(name: 'product_id')
  final int? productID;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'rating')
  final int? rating;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'errors')
  final String? errors;

  EditReviewResponse(this.reviewID, this.userID, this.productID, this.comment,
      this.rating, this.status, this.errors);

  factory EditReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$EditReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditReviewResponseToJson(this);
}
