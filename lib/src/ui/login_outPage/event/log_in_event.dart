abstract class LogInRemoteEvent {}

class LogInEvent extends LogInRemoteEvent {
  final List<String> saveInformation;
  LogInEvent(this.saveInformation);
}
