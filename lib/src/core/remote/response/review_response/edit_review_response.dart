import 'package:json_annotation/json_annotation.dart';

part 'edit_review_response.g.dart';

@JsonSerializable()
class EditReviewResponse {
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

  EditReviewResponse(this.userName, this.productID, this.comment, this.rating, this.status);

  factory EditReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$EditReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditReviewResponseToJson(this);
}
