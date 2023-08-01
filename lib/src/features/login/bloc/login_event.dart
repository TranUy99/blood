//Create event login
class LoginEvent {
  final String email;
  final String password;
  final bool isRemember;
  LoginEvent(this.email, this.password, this.isRemember);
}
