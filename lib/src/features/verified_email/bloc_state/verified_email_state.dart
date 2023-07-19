abstract class VerifiedEmailState{}

class SuccessVerifiedEmailState extends VerifiedEmailState{}

class ErrorVerifiedEmailState extends VerifiedEmailState{
  final String errorMessage;

  ErrorVerifiedEmailState(this.errorMessage);
}