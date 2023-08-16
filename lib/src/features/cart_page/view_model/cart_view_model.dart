import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_event.dart';

import '../../../core/model/product.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';

class CartViewModel {
  GetProductCartBloc getProductCartBloc = GetProductCartBloc();

  List<OrderProductDTO> cartList = [];

  Future<List<OrderProductDTO>> cartViewModel() async {
    await getProductCartBloc.getProductCartBloc();

    await getProductCartBloc.state.listen((state) {
      if (state is SuccessGetProductCartState) {
        cartList = state.list;
      } else if (state is ErrorGetProductCartState) {
        cartList = [];
      }
    });

    return cartList;
  }
}
