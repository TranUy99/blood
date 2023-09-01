import 'package:mobile_store/src/features/change_password/bloc/change_password_bloc.dart';
import 'package:mobile_store/src/features/change_password/bloc/change_password_event.dart';
import 'package:mobile_store/src/features/change_password/bloc/change_password_state.dart';

class ChangePasswordViewModel {
  final ChangePasswordBloc _changePasswordBloc = ChangePasswordBloc();


  //Add event change password and listen state
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final changePasswordEvent =
        ChangePasswordButtonPressedEvent(oldPassword: oldPassword, newPassword: newPassword);
    await _changePasswordBloc.addEvent(changePasswordEvent);

    bool isChangePassword = false;

    await _changePasswordBloc.changePasswordStateStream.listen(
      (state) {
        if (state is SuccessChangePasswordState) {
          isChangePassword = true;
        } else if (state is FailedChangePasswordState) {
          isChangePassword = false;
        }
      },
    );

    return isChangePassword;
  }
}
