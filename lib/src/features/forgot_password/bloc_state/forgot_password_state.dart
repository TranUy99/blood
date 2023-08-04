abstract class ForgotPasswordState{}

class SuccessSendEmailForgotPasswordState extends ForgotPasswordState{}

class ErrorSendEmailForgotPasswordState extends ForgotPasswordState{
  final String error;
  ErrorSendEmailForgotPasswordState(this.error);
}
