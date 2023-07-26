import 'dart:async';

import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/features/address/bloc/address_bloc.dart';
import 'package:mobile_store/src/features/address/bloc/address_event.dart';
import 'package:mobile_store/src/features/address/bloc/address_state.dart';

class AddressViewModel {
  final AddressBloc _addressBloc = AddressBloc();

// call event and listen province state
  Future<List<Province>> getProvince() async {
    final provinceEvent = GetProvinceEvent();
    List<Province> provinceList = [];
    Completer<List<Province>> completer = Completer<List<Province>>();

    await _addressBloc.addProvinceEvent(provinceEvent);

    StreamSubscription<AddressState>? subscription;
    subscription = _addressBloc.addressStateStream.listen((state) {
      if (state is SuccessGetProvinceState) {
        provinceList = state.province;
        completer.complete(provinceList);
        subscription!.cancel();
      } else if (state is FailedGetProvinceState) {
        completer.completeError("error");
        subscription!.cancel();
      }
    });
    return completer.future;
  }

// call event and listen district state
  Future<List<District>> getDistrict(String id) async {
    final districtEvent = GetDistrictEvent(id);
    List<District> districtList = [];
    Completer<List<District>> completer = Completer<List<District>>();

    await _addressBloc.addDistrictEvent(districtEvent);
    
    StreamSubscription<AddressState>? subscription;
    subscription = _addressBloc.addressStateStream.listen((state) {
      if (state is SuccessGetDistrictState) {
        districtList = state.district;
        completer.complete(districtList);
        subscription!.cancel();
      } else if (state is FailedGetDistrictState) {
        completer.completeError("error");
        subscription!.cancel();
      }
    });
    return completer.future;
  }
}
