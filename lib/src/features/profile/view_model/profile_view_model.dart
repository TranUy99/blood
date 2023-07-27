import 'dart:async';

import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_store/src/features/profile/bloc/profile_event.dart';
import 'package:mobile_store/src/features/profile/bloc/profile_state.dart';

class ProfileViewModel {
  final ProfileBloc _profileBloc = ProfileBloc();

  Future<List<Address>> getAddress() async {
    final addressEvent = GetAddressEvent();
    List<Address> addressList = [];

    Completer<List<Address>> completer = Completer<List<Address>>();
    
    await _profileBloc.getAddressEvent(addressEvent);

    StreamSubscription<ProfileState>? subscription;
    subscription = _profileBloc.profileStateStream.listen((state) {
      if (state is SuccessGetAddressState) {
        addressList = state.address;
        completer.complete(addressList);
        subscription!.cancel(); 
      } else if (state is FailedGetAddressState) {
        completer.completeError('Error fetching products');
        subscription!.cancel(); 
      }
    });

    return completer.future;
  }
}
