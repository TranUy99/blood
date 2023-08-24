import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';
import 'package:mobile_store/src/features/verified_email/service/verified_email_service.dart';
import 'package:rxdart/rxdart.dart';

class VerifiedEmailBloc {
  final _sendEmailStateController = BehaviorSubject<SendEmailState>();
  final _verifiedEmailStateController = BehaviorSubject<VerifiedEmailState>();

  Stream<SendEmailState> get stateSendEmail => _sendEmailStateController.stream;
  Stream<VerifiedEmailState> get stateVerifiedEmail => _verifiedEmailStateController.stream;

  //Listen from SendEmailEvent
  Future<void> sendEmailEvent(SendEmailEvent event) async {
    await _sendEmail(event.email);
  }

  //Call api sendEmail
  Future<void> _sendEmail(String email) async {
    String? message;
    String? errors;
    final sendEmailResult = VerifiedEmailService.sendEmailService(email);
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

  //Listen from ActivateOTPEvent
  Future<void> activeOTPEvent(ActivateOTPEvent event) async {
    await _activeOTP(event.activeOTP);
  }

  //Call api activeOTP and check state
  Future<void> _activeOTP(String activeOTP) async {
    String? message;
    final activeOTPResult = VerifiedEmailService.activeOTPService(activeOTP);
    try {

        message = await activeOTPResult;


    } catch (e) {
      message = e.toString();
    }

    print('message $message');

    if (message == '200') {
      _verifiedEmailStateController.sink.add(SuccessVerifiedEmailState());
    } else {
      _verifiedEmailStateController.sink
          .add(ErrorVerifiedEmailState('Failed to active OTP'));
    }
  }

  void dispose() {
    _sendEmailStateController.close();
    _verifiedEmailStateController.close();
  }
}
