import 'package:mobile_store/src/core/model/address.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

//get address state success
class SuccessGetAddressState extends ProfileState {
    final List<Address> address;
  SuccessGetAddressState(this.address);
}

//get add state failed
class FailedGetAddressState extends ProfileState {
  final String errorMessage;
  FailedGetAddressState(this.errorMessage);
}
