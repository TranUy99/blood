abstract class EditReviewState {}

class SuccessEditReviewState extends EditReviewState {}

class ErrorEditReviewState extends EditReviewState {
  String errorMessage;

  ErrorEditReviewState(this.errorMessage);
}