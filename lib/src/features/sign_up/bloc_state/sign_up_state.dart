abstract class SignUpState {}

class InitialState extends SignUpState {
  // Trạng thái khởi tạo
}

class SuccessSignUpState extends SignUpState {
  final bool onLoginState;
  SuccessSignUpState(this.onLoginState);


}

class ErrorSignUpState extends SignUpState {
  final String errorMessage;

  ErrorSignUpState(this.errorMessage);
}

