abstract class LogInRemoteEvent {}

class LogInEvent extends LogInRemoteEvent {
  final List<String> saveInformation;
  LogInEvent(this.saveInformation);
}

class OnChangePasswordEvent {
  final String onChangePasswordEvent;
  OnChangePasswordEvent(this.onChangePasswordEvent);
}
