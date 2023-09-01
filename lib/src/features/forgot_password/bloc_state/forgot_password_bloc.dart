import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_event.dart';
import 'package:mobile_store/src/features/forgot_password/bloc_state/forgot_password_state.dart';
import 'package:mobile_store/src/features/forgot_password/service/forgot_password_service.dart';
import 'package:rxdart/rxdart.dart';


class SendEmailForgotPasswordBloc {
  final _stateController = BehaviorSubject<SendEmailForgotPasswordState>();

  Stream<SendEmailForgotPasswordState> get state => _stateController.stream;

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

class ForgotPasswordBloc  {
  String? error;
  int? httpCode;
  final _stateController = BehaviorSubject<ForgotPasswordState>();

  Stream<ForgotPasswordState> get state => _stateController.stream;

  Future<void> forgotPasswordBloc(ForgotPasswordEvent event)async {
    final forgotPasswordResult = ForgotPasswordService().forgotPasswordService(event.newPassword, event.otp);

    try{
      await forgotPasswordResult.then((value) {
        error = value.error;
        httpCode = value.httpCode;
      });
    }catch(e){
      error = e.toString();
    }

    if(httpCode != null){
      _stateController.sink.add(SuccessForgotPasswordState());
    }else{
      _stateController.sink.add(ErrorForgotPasswordState(error ?? ''));
    }
  }
}