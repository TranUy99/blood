import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_bloc.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_event.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_state.dart';

class ForgotPasswordViewModel {
  final SendEmailForgotPasswordBloc _sendEmailForgotPasswordBloc =
      SendEmailForgotPasswordBloc();
  final ForgotPasswordBloc forgotPasswordBloc = ForgotPasswordBloc();

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

  Future<bool> forgotPasswordViewModel(String otp, String newPassword) async {
    bool isChangePassword = false;
    await forgotPasswordBloc.forgotPasswordBloc(ForgotPasswordEvent(otp, newPassword));

    await forgotPasswordBloc.state.listen((state) {
      if (state is SuccessForgotPasswordState) {
        isChangePassword = true;
      } else if (state is ErrorForgotPasswordState) {
        isChangePassword = false;
      }
    });

    return isChangePassword;
  }

}
