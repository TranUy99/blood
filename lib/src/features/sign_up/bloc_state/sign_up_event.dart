abstract class SignUpEvent{}
class SignUpButtonPressedEvent extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpButtonPressedEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });

  @override
  List<Object> get props => [email, password, fullName];

  @override
  String toString() {
    return 'SignUpButtonPressedEvent(email: $email, password: $password, fullName: $fullName)';
  }
}
