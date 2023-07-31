import 'package:mobile_store/src/core/remote/response/active_otp_response/active_otp_response.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';
import 'package:mobile_store/src/features/verified_email/service/verified_email_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class VerifiedEmailBloc {

}

class SendEmailBloc extends VerifiedEmailBloc {
  final _sendEmailStateController = BehaviorSubject<SendEmailState>();

  Stream<SendEmailState> get stateSendEmail => _sendEmailStateController.stream;

  //Listen from SendEmailEvent
  Future<void> sendEmailEvent(SendEmailEvent event) async {
    await _sendEmail(event.email);
  }

  //Call api sendEmail
  Future<void> _sendEmail(String email) async {
    String? message;
    String? errors;
    final sendEmailResult = SendEmailService.sendEmailService(email);
    try {
      await sendEmailResult.then((value) {
        errors = value.errors;
        message = value.message;
      });
    } catch (e) {
      errors = '$e';
    }

    if (errors == null) {
      _sendEmailStateController.sink.add(SuccessSendEmailState());
    } else {
      _sendEmailStateController.sink.add(ErrorSendEmailState(errors!));
    }
  }

  void dispose() {
    _sendEmailStateController.close();
  }
}




class ActivateOTPBloc extends VerifiedEmailBloc {
  final _activeOTPStateController = BehaviorSubject<ActiveOTPState>();

  Stream<ActiveOTPState> get stateActiveOTP =>
      _activeOTPStateController.stream;

  //Listen from ActivateOTPEvent
  Future<void> activeOTPEvent(ActivateOTPEvent event) async {
    await _activeOTP(event.activeOTP);
  }

  //Call api activeOTP and check state
  Future<void> _activeOTP(int activeOTP) async {
    String? message;
    String? error;
    final activeOTPResult = ActiveOTPService.activeOTPService(activeOTP);
    try {
      await activeOTPResult.then((value) {
        message = value.path;
      });

    } catch (e) {
      print('Failed to get data');
    }
    print(message);
    if (message == null) {
      _activeOTPStateController.sink.add(SuccessActiveOTPState());
    } else {
      _activeOTPStateController.sink.add(
          ErrorActiveOTPState('Failed to active OTP'));
    }
  }
  void dispose (){
    _activeOTPStateController.close();
  }
}