class CartEvent {

}

class GetLengthCartEvent extends CartEvent {
  final int lengthCartList;

  GetLengthCartEvent(this.lengthCartList);
}

class GetPriceCartEvent extends CartEvent {
  final double price;

  GetPriceCartEvent(this.price);
}

