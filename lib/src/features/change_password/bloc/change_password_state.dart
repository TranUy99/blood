abstract class ChangePasswordState {}

class InitialState extends ChangePasswordState {
  // Trạng thái khởi tạo
}

//State change password  success
class SuccessChangePasswordState extends ChangePasswordState {
  final bool onLoginState;

  SuccessChangePasswordState(this.onLoginState);
}

//State change password failed
class FailedChangePasswordState extends ChangePasswordState {
  final String errorMessage;

  FailedChangePasswordState(this.errorMessage);
}
