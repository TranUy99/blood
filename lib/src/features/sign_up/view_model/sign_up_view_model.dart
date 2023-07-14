import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_bloc.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_state.dart';

class SignUpViewModel {
  final SignUpBloc _signUpBloc = SignUpBloc();
  Stream<SignUpState> get signUpStateStream => _signUpBloc.signUpStateStream;


  void signUp(String email, String password, String fullName) {
    final signUpEvent = SignUpButtonPressedEvent(email: email, password: password, fullName: fullName);
    _signUpBloc.addEvent(signUpEvent);
   
    
  }

  void dispose() {
    _signUpBloc.dispose();
  }
}
