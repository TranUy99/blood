abstract class ForgotPasswordEvent{}

class SendEmailForgotPasswordEvent extends ForgotPasswordEvent{
  final String email;
  SendEmailForgotPasswordEvent(this.email);
}
