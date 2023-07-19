import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';

import '../bloc_state/verified_email_bloc.dart';

class VerifiedEmailViewModel {
  final VerifiedEmailBloc _verifiedEmailBloc = VerifiedEmailBloc();

  Future<void> sendEmail(String email) async {
    await _verifiedEmailBloc.sendEmailEvent(SendEmailEvent(email));

  }

  Future<bool> activeOTP(String otpNumber) async {
    await _verifiedEmailBloc.activeOTPEvent(ActivateOTPEvent(otpNumber));
    bool isVerified = false;

    await _verifiedEmailBloc.state.listen((state) {
      if (state is SuccessVerifiedEmailState) {
        isVerified = true;
      } else {
        isVerified = false;
      }
    },
    );
    return isVerified;
  }

  void dispose() {
    _verifiedEmailBloc.dispose();
  }
}