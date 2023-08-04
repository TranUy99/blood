import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/profile/bloc/profile_event.dart';
import 'package:mobile_store/src/features/profile/bloc/profile_state.dart';
import 'package:mobile_store/src/features/profile/service/profile_service.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final BehaviorSubject<ProfileState> _profileStateSubject = BehaviorSubject<ProfileState>();

  Stream<ProfileState> get profileStateStream => _profileStateSubject.stream;


  Future<void> getAddressEvent(ProfileEvent event) async{
    if(event is GetAddressEvent){
   final List<Address> address = await ProfileService.getAddressService();

    if (address.isNotEmpty) {
      _profileStateSubject.sink.add(SuccessGetAddressState(address));
      
    } else {
      _profileStateSubject.sink.add(FailedGetAddressState("No address available"));
    }
    }
  } 
}
