abstract class ChangePasswordState {}

class InitialState extends ChangePasswordState {
  // Trạng thái khởi tạo
}

//State for login success
class SuccessChangePasswordState extends ChangePasswordState {
  final bool onLoginState;

  SuccessChangePasswordState(this.onLoginState);
}

//State for login failed
class FailedChangePasswordState extends ChangePasswordState {
  final String errorMessage;

  FailedChangePasswordState(this.errorMessage);
}
