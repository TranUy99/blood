import 'dart:developer';

import 'package:mobile_store/src/features/address/bloc/address_event.dart';
import 'package:mobile_store/src/features/address/bloc/address_state.dart';
import 'package:mobile_store/src/features/address/service/address_service.dart';
import 'package:rxdart/rxdart.dart';

class AddressBloc {
  final BehaviorSubject<AddressState> _addressStateSubject = BehaviorSubject<AddressState>();

  Stream<AddressState> get addressStateStream => _addressStateSubject.stream;

  Future<void> addProvinceEvent(AddressEvent event) async {
    if (event is GetProvinceEvent) {
      final getProvinceResult = await AddressService.getProvinces();
      if (getProvinceResult.isNotEmpty) {
        _addressStateSubject.sink.add(SuccessGetProvinceState(getProvinceResult));
      } else {
        _addressStateSubject.sink.add(FailedGetProvinceState("errorMessage"));
      }
    }
  }

  Future<void> addDistrictEvent(AddressEvent event) async {
    if (event is GetDistrictEvent) {
      final getProvinceResult = await AddressService.getDistrict(event.id!);
      if (getProvinceResult.isNotEmpty) {
        _addressStateSubject.sink.add(SuccessGetDistrictState(getProvinceResult));
      } else {
        _addressStateSubject.sink.add(FailedGetDistrictState("errorMessage"));
      }
    }
  }

  Future<void> addWardEvent(AddressEvent event) async {
    if (event is GetWardEvent) {
      final getProvinceResult = await AddressService.getWard(event.id);
      if (getProvinceResult.isNotEmpty) {
        _addressStateSubject.sink.add(SuccessGetWardState(getProvinceResult));
      } else {
        _addressStateSubject.sink.add(FailedGetWardState("errorMessage"));
      }
    }
  }

  Future<void> addCreateAddress(AddressEvent event) async {
    if (event is CreateAddressEvent) {
      final createAddress = await AddressService.createAddress(
          event.location, event.type, event.phoneReceiver, event.nameReceiver);
     
      if (createAddress.message == null) {
        _addressStateSubject.sink.add(SuccessAddressState(true));
      } else {
        _addressStateSubject.sink.add(FailedAddressState("error"));
      }
    }
  }
}
