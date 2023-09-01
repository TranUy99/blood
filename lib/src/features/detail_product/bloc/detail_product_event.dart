abstract class DetailProductEvent {}

//create event product detail
class GetDetailProductEvent extends DetailProductEvent {
  final int id;

  GetDetailProductEvent(this.id);
}


class GetRelatedProductEvent extends DetailProductEvent {
  final int id;

  GetRelatedProductEvent(this.id);
}
