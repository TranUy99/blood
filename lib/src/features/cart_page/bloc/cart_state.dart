import 'package:mobile_store/src/core/model/product.dart';

import '../../../core/model/order_product_dto.dart';

class GetProductCartState {}

class SuccessGetProductCartState extends GetProductCartState {
  final List<OrderProductDTO> list;

  SuccessGetProductCartState(this.list);
}

class ErrorGetProductCartState extends GetProductCartState {
  final String? error;

  ErrorGetProductCartState(this.error);
}

class GetDataCartState {}

class SuccessGetDataCartState extends GetDataCartState {
  List<ProductDTO>? productDTOList;

  SuccessGetDataCartState(this.productDTOList);
}

class ErrorGetDataCartState extends GetDataCartState {}

class CartState {}

class GetLengthCartState extends CartState {
  final int cartListLength;

  GetLengthCartState(this.cartListLength);
}

class GetPriceCartState extends CartState {
  final double price;

  GetPriceCartState(this.price);
}

class GetSelectedPromotionState extends CartState {
  final int? selectedPromotion;

  GetSelectedPromotionState(this.selectedPromotion);
}
