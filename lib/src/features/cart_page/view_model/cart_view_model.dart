import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';

import '../../../../main.dart';
import '../../../core/model/product.dart';
import '../../component/custom_app_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartViewModel {
  GetProductCartBloc getProductCartBloc = GetProductCartBloc();
  GetDataCartBloc getDataCartBloc = GetDataCartBloc();
  double price = 0;
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

  streamLengthCartList() async {
    List<OrderProductDTO> list = await cartViewModel();

    CustomAppBar.cartBloc.eventController.sink
        .add(GetLengthCartEvent(list.length));
  }

  streamPriceCartList() async {
    double totalPrice = 0;
    List<OrderProductDTO> list = await cartViewModel();
    for (int i = 0; i < list.length; i++) {
      totalPrice += list[i].price!;
    }

    CartPage.cartBloc.eventController.sink.add(GetPriceCartEvent(totalPrice));
  }

  GetLengthCartState initialLengthCart() {
    int length = 0;

    for (int i = 0; i < getUser.cartBox!.length; i++) {
      ProductDetailCart productDetailCart = getUser.cartBox!.getAt(i);
      length += productDetailCart.productQuantity;
    }
    return GetLengthCartState(length);
  }

  Future<List<ProductDTO>?> getDataCartViewModel() async {
    List<ProductDTO>? productList;

    await getDataCartBloc.getDataBloc();

    await getDataCartBloc.state.listen((state) {
      if (state is SuccessGetDataCartState) {
        productList = state.productDTOList;
      } else if (state is ErrorGetDataCartState) {
        productList = [];
      }
    });

    return productList;
  }

  Future<double> totalPay() async {
    double total = 0;
    cartList = await cartViewModel();
    for (int i = 0; i < cartList.length; i++) {
      total += cartList[i].price!;
    }
    return total;
  }
}
