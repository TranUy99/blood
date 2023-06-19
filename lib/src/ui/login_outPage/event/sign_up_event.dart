abstract class SignUpRemoteEvent{}

class SignUpEvent extends SignUpRemoteEvent{
  final List<String> saveInformation;
  SignUpEvent(this.saveInformation);
}

