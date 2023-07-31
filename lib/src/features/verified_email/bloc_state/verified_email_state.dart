abstract class SendEmailState {}

// State for success verified
class SuccessSendEmailState extends SendEmailState {}

// State for failed verified
class ErrorSendEmailState extends SendEmailState {
  final String? errorMessage;

  ErrorSendEmailState(this.errorMessage);
}

abstract class ActiveOTPState {}

// State for success verified
class SuccessActiveOTPState extends ActiveOTPState {}

// State for failed verified
class ErrorActiveOTPState extends ActiveOTPState {
  final String? errorMessage;

  ErrorActiveOTPState(this.errorMessage);
}
