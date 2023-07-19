abstract class SignUpEvent {}

class SignUpButtonPressedEvent extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpButtonPressedEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
