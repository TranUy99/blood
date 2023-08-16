import '../../../core/model/order_product_dto.dart';

class CartEvent {}

class GetProductCartEvent extends CartEvent {
  final int productID;

  GetProductCartEvent(this.productID);
}

