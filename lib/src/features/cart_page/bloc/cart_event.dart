import '../../../core/model/order_product_dto.dart';

class CartEvent {}

class CreateItemCart extends CartEvent{}

class UpdateItemCart extends CartEvent{}

class DeleteItemCart extends CartEvent{}

class GetItemCart extends CartEvent{}

class GetLengthCartEvent {

}

class AddItemToCartEvent extends GetLengthCartEvent {
  final int addToCartList;

  AddItemToCartEvent(this.addToCartList);
}

