import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/bloc/login_state.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_event.dart';
import 'package:mobile_store/src/features/verified_email/bloc_state/verified_email_state.dart';
import 'package:mobile_store/src/features/verified_email/service/verified_email_service.dart';

import '../../login/service/login_service.dart';
import '../bloc_state/verified_email_bloc.dart';

class VerifiedEmailViewModel {
  final SendEmailBloc _sendEmailBloc = SendEmailBloc();
  final ActivateOTPBloc _activateOTPBloc = ActivateOTPBloc();

  //Call email event
  Future<bool> sendEmail(String email) async {
    await _sendEmailBloc.sendEmailEvent(SendEmailEvent(email));
    bool isVerified = false;

    await _sendEmailBloc.stateSendEmail.listen((state) {
      if(state is SuccessSendEmailState){
        isVerified = true;
      }else if(state is ErrorSendEmailState){
        isVerified = false;
      }
    });
    return isVerified;
  }

  //Call event active OTP and return state of activeOTP
  Future<bool> activeOTP(int otpNumber) async {
    await _activateOTPBloc.activeOTPEvent(ActivateOTPEvent(otpNumber));
    bool isVerified = false;

    await _activateOTPBloc.stateActiveOTP.listen(
          (state) {
        if (state is SuccessActiveOTPState) {
          successLoginState = SuccessLoginState(true, true);
          isVerified = true;
        } else if(state is ErrorActiveOTPState){
          isVerified = false;
        }
      },
    );
    return isVerified;
  }

  void dispose() {
    _activateOTPBloc.dispose();
    _sendEmailBloc.dispose();
  }
}
