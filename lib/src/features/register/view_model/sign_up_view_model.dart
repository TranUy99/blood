import 'package:mobile_store/src/features/register/bloc_state/sign_up_bloc.dart';
import 'package:mobile_store/src/features/register/bloc_state/sign_up_event.dart';

class SignUpViewModel {
  final _signUpBloc = SignUpBloc();

  void signUp(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) {
    final signUpEvent = SignUpEvent(email, password, fullName, phoneNumber);
    _signUpBloc.addEvent(signUpEvent);
  }
   void dispose() {}
}
