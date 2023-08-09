abstract class SendEmailForgotPasswordState {}

class SuccessSendEmailForgotPasswordState
    extends SendEmailForgotPasswordState {}

class ErrorSendEmailForgotPasswordState extends SendEmailForgotPasswordState {
  final String error;

  ErrorSendEmailForgotPasswordState(this.error);
}

abstract class ForgotPasswordState {}

class SuccessForgotPasswordState extends ForgotPasswordState {}

class ErrorForgotPasswordState extends ForgotPasswordState {
  final String error;

  ErrorForgotPasswordState(this.error);
}
