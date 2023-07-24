abstract class VerifiedEmailEvent{}

class SendEmailEvent extends VerifiedEmailEvent{
  final String email;
  SendEmailEvent(this.email);
}

class ActivateOTPEvent extends VerifiedEmailEvent{
  final String activeOTP;
  ActivateOTPEvent(this.activeOTP);
}