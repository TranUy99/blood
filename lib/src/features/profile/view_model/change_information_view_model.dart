import 'package:mobile_store/src/core/model/user.dart';
import 'package:mobile_store/src/features/profile/bloc/change_information_bloc.dart';
import 'package:mobile_store/src/features/profile/bloc/change_information_event.dart';
import 'package:mobile_store/src/features/profile/bloc/change_information_state.dart';
import 'package:mobile_store/src/features/profile/service/edit_information_service.dart';

class ChangeInformationViewModel {
  EditInformationService editInformationService = EditInformationService();
  ChangeInformationBloc changeInformationBloc = ChangeInformationBloc();

  Future<UserDTO> changeInformationViewModel(
      String fullName, int gender, String birthDay) async {
    UserDTO? userDTO;

    await changeInformationBloc
        .changeInformation(ChangeInformationEvent(fullName, birthDay, gender));

    await changeInformationBloc.state.listen((state) {
      if (state is SuccessChangeInformationState) {
        userDTO = state.userDTO;
      } else if (state is ErrorChangeInformationState) {
        userDTO == null;
      }
    });
    return userDTO!;
  }
}
