abstract class AddressEvent {}

//create province event
class GetProvinceEvent extends AddressEvent {}

//create district event
class GetDistrictEvent extends AddressEvent {
  final String? provinceId;
  GetDistrictEvent(this.provinceId);
}

//create ward event
class GetWardEvent extends AddressEvent {
  final String? districtId;
  GetWardEvent(this.districtId);
}

// get address
class GetAddressEvent extends AddressEvent {}

//create add event
class CreateAddressEvent extends AddressEvent {
  final String? location;
  final String? type;
  final String? phoneReceiver;
  final String? nameReceiver;

  CreateAddressEvent(this.location, this.nameReceiver, this.phoneReceiver, this.type);
}

class ChangeAddressEvent extends AddressEvent {
  final String? location;
  final String? type;
  final String? phoneReceiver;
  final String? nameReceiver;
  final bool? defaults;
  final int? id;

  ChangeAddressEvent(
      this.location, this.nameReceiver, this.phoneReceiver, this.type, this.defaults, this.id);
}

class DeleteAddressEvent extends AddressEvent {
  final int? id;

  DeleteAddressEvent(this.id);
}
// get IdAddress
class GetIdAddressEvent extends AddressEvent {
  final int? idAddress;
  GetIdAddressEvent(this.idAddress);
}
