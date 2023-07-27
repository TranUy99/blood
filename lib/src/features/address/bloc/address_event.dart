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
