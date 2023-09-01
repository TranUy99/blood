import '../../../core/remote/response/review_response/review_response.dart';

abstract class GetReviewState {}

class SuccessGetReviewState extends GetReviewState {
  ReviewResponse reviewResult;

  SuccessGetReviewState(this.reviewResult);
}

class ErrorGetReviewState extends GetReviewState {
  String errorMessage;

  ErrorGetReviewState(this.errorMessage);
}

abstract class CreateReviewState {}

class SuccessCreateReviewState extends CreateReviewState {}

class ErrorCreateReviewState extends CreateReviewState {
  String errorMessage;

  ErrorCreateReviewState(this.errorMessage);
}

abstract class EditReviewState {}

class SuccessEditReviewState extends EditReviewState {}

class ErrorEditReviewState extends EditReviewState {
  String errorMessage;

  ErrorEditReviewState(this.errorMessage);
}