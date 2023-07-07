import 'package:equatable/equatable.dart';

class LoginEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}