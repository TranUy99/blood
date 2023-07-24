abstract class DetailProductEvent {}

//create event product detail
class GetDetailProductEvent extends DetailProductEvent {
  final int id;

  GetDetailProductEvent(this.id);
}
