abstract class SignUpState {}

class InitialState extends SignUpState {
  // Trạng thái khởi tạo
}

//State for login success
class SuccessSignUpState extends SignUpState {
  final bool onLoginState;

  SuccessSignUpState(this.onLoginState);
}

//State for login failed
class ErrorSignUpState extends SignUpState {
  final String errorMessage;

  ErrorSignUpState(this.errorMessage);
}
