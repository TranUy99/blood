abstract class SendEmailState {}

// State for success verified
class SuccessSendEmailState extends SendEmailState {}

// State for failed verified
class ErrorSendEmailState extends SendEmailState {
  final String? errorMessage;

  ErrorSendEmailState(this.errorMessage);
}

abstract class VerifiedEmailState {}

// State for success verified
class SuccessVerifiedEmailState extends VerifiedEmailState {}

// State for failed verified
class ErrorVerifiedEmailState extends VerifiedEmailState {
  final String? errorMessage;

  ErrorVerifiedEmailState(this.errorMessage);
}
