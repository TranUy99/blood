abstract class DetailProductEvent {}

class GetDetailProductEvent extends DetailProductEvent {
  final int id;
  GetDetailProductEvent(this.id);
}
