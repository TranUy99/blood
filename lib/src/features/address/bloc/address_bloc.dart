import 'dart:async';

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
      final getProvinceResult = await AddressService.getDistrict(event.provinceId!);
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
      final getProvinceResult = await AddressService.getWard(event.districtId);
      if (getProvinceResult.isNotEmpty) {
        _addressStateSubject.sink.add(SuccessGetWardState(getProvinceResult));
      } else {
        _addressStateSubject.sink.add(FailedGetWardState("errorMessage"));
      }
    }
  }

// create address
  Future<void> addCreateAddressEvent(AddressEvent event) async {
    if (event is CreateAddressEvent) {
      final createAddress = await AddressService.createAddress(
          event.location, event.type, event.phoneReceiver, event.nameReceiver);

      if (createAddress.path == null) {
        _addressStateSubject.sink.add(SuccessCreateAddressState(true));
      } else {
        _addressStateSubject.sink.add(FailedCreateAddressState("error"));
      }
    }
  }

//get address
  Future<void> getAddressEvent(AddressEvent event) async {
    if (event is GetAddressEvent) {
      final List<Address> address = await AddressService.getAddressService();

      if (address.isNotEmpty) {
        _addressStateSubject.sink.add(SuccessGetAddressState(address));
      } else {
        _addressStateSubject.sink.add(FailedGetAddressState("No address available"));
      }
    }
  }
//get id address
  Future<void> getIdAddressEvent(AddressEvent event) async {
    if (event is GetIdAddressEvent) {
      final Address address = await AddressService.getIdAddressService(event.idAddress);

      if (address != null) {
        _addressStateSubject.sink.add(SuccessGetIdAddressState(address));
      } else {
        _addressStateSubject.sink.add(FailedGetIdAddressState("No address available"));
      }
    }
  }
//change address
    Future<void> changeAddressEvent(AddressEvent event) async {
    if (event is ChangeAddressEvent) {
      final changeAddress = await AddressService.changeAddress(
          event.location, event.type, event.phoneReceiver, event.nameReceiver, event.defaults, event.id);

      if (changeAddress.message == null) {
        _addressStateSubject.sink.add(SuccessChangeAddressState(true));
      } else {
        _addressStateSubject.sink.add(FailedChangeAddressState("error"));
      }
    }
  }

//delete address
    Future<void> deleteAddressEvent(AddressEvent event) async {
    if (event is DeleteAddressEvent) {
      final changeAddress = await AddressService.deleteAddress(
       event.id);

      if (changeAddress.response.statusCode==200) {
        _addressStateSubject.sink.add(SuccessDeleteAddressState(true));
      } else {
        _addressStateSubject.sink.add(FailedDeleteAddressState("error"));
      }
    }
  }
  void dispose() {
    _addressStateSubject.close();
  }
}
