import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_bloc.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_state.dart';

class SignUpViewModel {
  final SignUpBloc _signUpBloc = SignUpBloc();
  Stream<SignUpState> get signUpStateStream => _signUpBloc.signUpStateStream;

  Future<bool> signUp(String email, String password, String fullName) async {
    final signUpEvent = SignUpButtonPressedEvent(email: email, password: password, fullName: fullName);
    await _signUpBloc.addEvent(signUpEvent);
    
    bool isLogin = false;
    
    await _signUpBloc.signUpStateStream.listen(
      (state) {
        if (state is SuccessSignUpState) {
          isLogin = true;
        } else if (state is ErrorSignUpState) {
          isLogin = false;
        }
      },
    );

    return isLogin;
  }

  void dispose() {
    _signUpBloc.dispose();
  }
}
