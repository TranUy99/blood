import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';

abstract class GetReviewState {}

class SuccessGetReviewState extends GetReviewState {
  ReviewResponse reviewResult;

  SuccessGetReviewState(this.reviewResult);
}

class ErrorGetReviewState extends GetReviewState {
  String errorMessage;

  ErrorGetReviewState(this.errorMessage);
}
