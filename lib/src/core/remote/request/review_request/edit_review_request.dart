import 'package:json_annotation/json_annotation.dart';

part 'edit_review_request.g.dart';

//Send email, password to api
@JsonSerializable()
class EditReviewRequest {
  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'rating')
  final int? rating;

  @JsonKey(name: 'status')
  final bool? status;

  EditReviewRequest(this.userName, this.productId, this.comment, this.rating, this.status);

  factory EditReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$EditReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditReviewRequestToJson(this);
}