import 'package:json_annotation/json_annotation.dart';

part 'create_review_response.g.dart';

@JsonSerializable()
class CreateReviewResponse {
  @JsonKey(name: 'httpCode')
  final int? httpCode;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errors')
  final String? errors;

  @JsonKey(name: 'status')
  final bool? status;

  CreateReviewResponse(this.httpCode, this.message, this.errors, this.status);

  factory CreateReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReviewResponseToJson(this);
}