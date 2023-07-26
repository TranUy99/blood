
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';

abstract class AddressState {}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

//get province state success
class SuccessGetProvinceState extends AddressState {
  final List<Province> province;

  SuccessGetProvinceState(this.province);
}

//get province state failed
class FailedGetProvinceState extends AddressState {
  final String errorMessage;

  FailedGetProvinceState(this.errorMessage);
}

//get district state success
class SuccessGetDistrictState extends AddressState {
  final List<District> district;

  SuccessGetDistrictState(this.district);
}

//get district state failed
class FailedGetDistrictState extends AddressState {
  final String errorMessage;

  FailedGetDistrictState(this.errorMessage);
}

//get ward state success
class SuccessGetWardState extends AddressState {
  final List<Ward> ward;

  SuccessGetWardState(this.ward);
}

//get ward state failed
class FailedGetWardState extends AddressState {
  final String errorMessage;

  FailedGetWardState(this.errorMessage);
}