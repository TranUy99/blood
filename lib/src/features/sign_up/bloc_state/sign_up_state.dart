abstract class SignUpState {}

class InitialState extends SignUpState {
  // Trạng thái khởi tạo
}

class LoadingState extends SignUpState {
  // Trạng thái đang xử lý đăng nhập
}

class SignUpSuccessState extends SignUpState {
  // Trạng thái đăng ký thành công

  @override
  String toString() {
    return 'SignUpSuccessState';
  }
}

class SignUpFailureState extends SignUpState {
  final String errorMessage;

  SignUpFailureState(this.errorMessage);

  @override
  String toString() {
    return 'SignUpFailureState: errorMessage = $errorMessage';
  }
}