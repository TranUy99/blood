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

class GetSelectedPromotionEvent extends CartEvent {
  final int? selectedPromotion;

  GetSelectedPromotionEvent(this.selectedPromotion);
}
