abstract class AddressEvent {}

//create province event
class GetProvinceEvent extends AddressEvent {}



//create district event
class GetDistrictEvent extends AddressEvent {
  final String? id;
  GetDistrictEvent(this.id);
}

//create ward event
class GetWardEvent extends AddressEvent {
  final String? id;
  GetWardEvent(this.id);
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

  ChangeAddressEvent(this.location, this.nameReceiver, this.phoneReceiver, this.type, this.defaults);
}
