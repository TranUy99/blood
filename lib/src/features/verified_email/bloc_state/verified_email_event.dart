abstract class VerifiedEmailEvent {}

//Event for send email
class SendEmailEvent extends VerifiedEmailEvent {
  final String email;

  SendEmailEvent(this.email);
}

//Event for activate otp
class ActivateOTPEvent extends VerifiedEmailEvent {
  final String activeOTP;

  ActivateOTPEvent(this.activeOTP);
}
