abstract class CreateReviewState{}

class SuccessCreateReviewState extends CreateReviewState{}

class ErrorCreateReviewState extends CreateReviewState {
  String errorMessage;
  ErrorCreateReviewState(this.errorMessage);
}