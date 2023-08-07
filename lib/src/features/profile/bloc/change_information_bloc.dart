import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/features/profile/bloc/change_information_event.dart';
import 'package:mobile_store/src/features/profile/service/edit_information_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/model/user.dart';
import 'change_information_state.dart';

class ChangeInformationBloc {
  EditInformationService editInformationService = EditInformationService();
  String? error;
  final _stateController = BehaviorSubject<ChangeInformationState>();

  Stream<ChangeInformationState> get state => _stateController.stream;

  Future<void> changeInformation(ChangeInformationEvent event) async {
    UserDTO? userDTO;
    try {
      final changeInformationResult =
          editInformationService.editInformationService(
              getUser.userDTO.id!,
              getUser.token!,
              getUser.email!,
              event.fullName,
              event.gender,
              event.birthDay);
      userDTO = await changeInformationResult;
    } catch (e) {
      error = e.toString();
    }

    if (error == null) {
      _stateController.sink.add(SuccessChangeInformationState(userDTO!));
    } else {
      _stateController.sink.add(ErrorChangeInformationState(error ?? ''));
    }
  }
}
