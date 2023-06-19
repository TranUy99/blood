import 'dart:async';

import '../event/sign_up_event.dart';
import '../state/sign_up_state.dart';

class SignUpBloc{
  var state = SignUpState([]);
  final eventSignUpController = StreamController<SignUpRemoteEvent>();
  final stateController = StreamController<SignUpState>();
  SignUpBloc(){
    eventSignUpController.stream.listen((event) {
      if(event is SignUpEvent){
        state = SignUpState(event.saveInformation);
      }
      stateController.sink.add(state);
    });
  }
}