import 'dart:async';
import 'package:mobile_store/src/features/change_password/bloc/change_password_event.dart';
import 'package:mobile_store/src/features/change_password/bloc/change_password_state.dart';
import 'package:mobile_store/src/features/change_password/service/change_password_service.dart';
import 'package:rxdart/rxdart.dart';

class ChangePasswordBloc {
  final BehaviorSubject<ChangePasswordState> _changePasswordStateSubject =
      BehaviorSubject<ChangePasswordState>();

  Stream<ChangePasswordState> get changePasswordStateStream => _changePasswordStateSubject.stream;

  Future<void> addEvent(ChangePasswordEvent event) async {
    if (event is ChangePasswordButtonPressedEvent) {
      final newPassword = event.newPassword;
      final oldPassword = event.oldPassword;
      try {
        final changePasswordResult =
            await ChangePasswordService.changePassword(oldPassword, newPassword);

        if (changePasswordResult.path == null) {
          _changePasswordStateSubject.sink.add(SuccessChangePasswordState(true));
        } else {
          _changePasswordStateSubject.sink
              .add(FailedChangePasswordState("error"));
        }
      } catch (e) {
        _changePasswordStateSubject.sink.add(FailedChangePasswordState("error"));
      }
    }
  }
}

