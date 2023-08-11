

class SendEmailForgotPasswordEvent {
  final String email;
  SendEmailForgotPasswordEvent(this.email);
}

class ForgotPasswordEvent {
  final String otp;
  final String newPassword;
  ForgotPasswordEvent(this.otp, this.newPassword);
}
