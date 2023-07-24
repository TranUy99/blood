abstract class VerifiedEmailState {}

// State for success verified
class SuccessVerifiedEmailState extends VerifiedEmailState {}

// State for failed verified
class ErrorVerifiedEmailState extends VerifiedEmailState {
  final String errorMessage;

  ErrorVerifiedEmailState(this.errorMessage);
}
