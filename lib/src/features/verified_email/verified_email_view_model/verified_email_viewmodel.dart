import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_state.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';

import '../bloc_state/verified_email_bloc.dart';

class VerifiedEmailViewModel {
  final VerifiedEmailBloc _verifiedEmailBloc = VerifiedEmailBloc();

  //Call email event
  Future<bool> sendEmail(String email) async {
    await _verifiedEmailBloc.sendEmailEvent(SendEmailEvent(email));
    bool isVerified = false;

    await _verifiedEmailBloc.stateSendEmail.listen((state) {
      if(state is SuccessSendEmailState){
        isVerified = true;
      }else if(state is ErrorSendEmailState){
        isVerified = false;
      }
    });
    return isVerified;
  }

  //Call event active OTP and return state of activeOTP
  Future<bool> activeOTP(String otpNumber) async {
    await _verifiedEmailBloc.activeOTPEvent(ActivateOTPEvent(otpNumber));
    bool isVerified = false;

    await _verifiedEmailBloc.stateVerifiedEmail.listen(
          (state) {
        if (state is SuccessVerifiedEmailState) {
          successLoginState = SuccessLoginState(true, true);
          isVerified = true;
        } else if(state is ErrorVerifiedEmailState){
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
