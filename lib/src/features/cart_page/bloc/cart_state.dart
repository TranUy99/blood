import 'package:mobile_store/src/core/model/product.dart';

import '../../../core/model/order_product_dto.dart';

class GetProductCartState {

}

class SuccessGetProductCartState extends GetProductCartState{
  List<OrderProductDTO> list;
  SuccessGetProductCartState(this.list);
}

class ErrorGetProductCartState extends GetProductCartState{
  final String? error;
  ErrorGetProductCartState(this.error);
}
