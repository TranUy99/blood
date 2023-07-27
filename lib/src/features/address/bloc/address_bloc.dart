import 'dart:developer';

import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/bloc/address_event.dart';
import 'package:mobile_store/src/features/address/bloc/address_state.dart';
import 'package:mobile_store/src/features/address/service/address_service.dart';
import 'package:rxdart/rxdart.dart';

class AddressBloc {
  final BehaviorSubject<AddressState> _addressStateSubject = BehaviorSubject<AddressState>();

  Stream<AddressState> get addressStateStream => _addressStateSubject.stream;

//add province
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

//add district
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

//add ward
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

//get address
    Future<void> getAddressEvent(AddressEvent event) async{
    if(event is GetAddressEvent){
   final List<Address> address = await AddressService.getAddressService();

    if (address.isNotEmpty) {
      _addressStateSubject.sink.add(SuccessGetAddressState(address));
      
    } else {
      _addressStateSubject.sink.add(FailedGetAddressState("No address available"));
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
