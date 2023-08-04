import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_event.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_state.dart';
import 'package:mobile_store/src/features/forgot_password/service/forgot_password_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class ForgotPasswordBloc{}

class SendEmailForgotPasswordBloc {
  final _stateController = BehaviorSubject<ForgotPasswordState>();

  Stream<ForgotPasswordState> get state => _stateController.stream;

  Future<void> addEvent(SendEmailForgotPasswordEvent event) async {
    await _sendEmailForgotPassword(event.email);
  }

  Future<void> _sendEmailForgotPassword(String email) async {
    final sendEmailForgotPassword =
    ForgotPasswordService().sendEmailForgotPasswordService(email);
    int? httpCode;
    String? error;

    try {
      await sendEmailForgotPassword.then((value) {
        httpCode = value.httpCode;
        error = value.message;
      });
    } catch (e) {
      error = e.toString();
    }

    if (httpCode != null) {
      _stateController.add(SuccessSendEmailForgotPasswordState());
    } else {
      _stateController.add(ErrorSendEmailForgotPasswordState(error ?? ''));
    }
  }
}


