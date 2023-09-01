import 'package:json_annotation/json_annotation.dart';

part 'create_review_request.g.dart';

//Send email, password to api
@JsonSerializable()
class CreateReviewRequest {
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

  CreateReviewRequest(this.userName, this.productId, this.comment, this.rating, this.status);

  factory CreateReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReviewRequestToJson(this);
}
