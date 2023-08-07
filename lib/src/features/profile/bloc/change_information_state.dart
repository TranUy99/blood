import 'package:mobile_store/src/core/model/user.dart';

abstract class ChangeInformationState{}

class SuccessChangeInformationState extends ChangeInformationState{
  UserDTO userDTO;
  SuccessChangeInformationState(this.userDTO);
}

class ErrorChangeInformationState extends ChangeInformationState{
  String error;
  ErrorChangeInformationState(this.error);
}