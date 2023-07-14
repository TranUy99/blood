import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_bloc.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_event.dart';
import 'package:mobile_store/src/features/sign_up/bloc_state/sign_up_state.dart';

class SignUpViewModel {
  final _signUpBloc = SignUpBloc();
  Stream<SignUpState> get signUpStateStream => _signUpBloc.signUpStateStream;

  bool isSigningUp = false; // Add a flag to track if the sign-up process is in progress

  void signUp(String email, String password, String fullName) {
    if (!isSigningUp) {
      isSigningUp = true; // Set the flag to true before starting the sign-up process

      final signUpEvent = SignUpButtonPressedEvent(email, password, fullName);
      _signUpBloc.addEvent(signUpEvent);
    }
  }

  void dispose() {
    _signUpBloc.dispose();
  }
}
