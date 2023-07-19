import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';
import 'package:mobile_store/src/features/verified_email/service/verified_email_service.dart';
import 'package:rxdart/rxdart.dart';

class VerifiedEmailBloc {
  final _stateController = BehaviorSubject<VerifiedEmailState>();

  Stream<VerifiedEmailState> get state => _stateController.stream;

  //Listen from SendEmailEvent
  Future<void> sendEmailEvent(SendEmailEvent event) async {
    await _sendEmail(event.email);
  }

  //Call api sendEmail
  Future<void> _sendEmail(String email) async {
    String? message;
    final sendEmailResult = VerifiedEmailService.sendEmailService(email);
    try {
      await sendEmailResult.then((value) {
        message = value.message;
      });
    } catch (e) {
      message = 'Failed to get data';
    }

    if (message == 'SEND MAIL') {
      _stateController.add(SuccessVerifiedEmailState());
    } else {
      _stateController.add(ErrorVerifiedEmailState('Failed to send email'));
    }
  }

  //Listen from ActivateOTPEvent
  Future<void> activeOTPEvent(ActivateOTPEvent event) async {
    await _activeOTP(event.activeOTP);
  }

  //Call api activeOTP
  Future<void> _activeOTP(String activeOTP) async {
    String? message;
    final activeOTPResult = VerifiedEmailService.activeOTPService(activeOTP);
    try {
      await activeOTPResult.then((value) {
        message = value.message;
      });
    } catch (e) {
      message = 'Failed to get data';
    }

    if (message != 'UNEXPECTED ERROR OCCURRED') {
      _stateController.add(SuccessVerifiedEmailState());
    } else {
      _stateController.add(ErrorVerifiedEmailState('Failed to active OTP'));
    }
  }

  void dispose() {
    _stateController.close();
  }
}
