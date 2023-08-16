class AppBarEvent {

}

class AddItemToCartEvent extends AppBarEvent {
  final int addToCartList;

  AddItemToCartEvent(this.addToCartList);
}
