import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_bloc.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_event.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_state.dart';

class ForgotPasswordViewModel {
  final SendEmailForgotPasswordBloc _sendEmailForgotPasswordBloc =
      SendEmailForgotPasswordBloc();

  Future<bool> sendEmailForgotPasswordViewModel(String email) async {
    bool isSend = false;
    await _sendEmailForgotPasswordBloc
        .addEvent(SendEmailForgotPasswordEvent(email));

    await _sendEmailForgotPasswordBloc.state.listen((state) {
      if (state is SuccessSendEmailForgotPasswordState) {
        isSend = true;
      } else if (state is ErrorSendEmailForgotPasswordState) {
        isSend = false;
      }
    });

    return isSend;
  }
}
