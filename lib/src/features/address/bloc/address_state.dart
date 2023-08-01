import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';

abstract class AddressState {}

class InitialAddressState extends AddressState {}

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

//State address success
class SuccessCreateAddressState extends AddressState {
  final bool onSuccessCreateAddressState;

  SuccessCreateAddressState(this.onSuccessCreateAddressState);
}

//State address failed
class FailedCreateAddressState extends AddressState {
  final String errorMessage;

  FailedCreateAddressState(this.errorMessage);
}

//get address state success
class SuccessGetAddressState extends AddressState {
  final List<Address> address;
  SuccessGetAddressState(this.address);
}

//get address state failed
class FailedGetAddressState extends AddressState {
  final String errorMessage;
  FailedGetAddressState(this.errorMessage);
}

//change address state success
class SuccessChangeAddressState extends AddressState {
  final bool onSuccessCreateAddressState;

  SuccessChangeAddressState(this.onSuccessCreateAddressState);
}

//change address state failed
class FailedChangeAddressState extends AddressState {
  final String errorMessage;
  FailedChangeAddressState(this.errorMessage);
}
