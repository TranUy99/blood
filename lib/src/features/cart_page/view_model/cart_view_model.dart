import 'package:mobile_store/src/core/model/order_product_dto.dart';

import '../../../../main.dart';
import '../../../core/model/product.dart';
import '../../component/custom_app_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartViewModel {
  GetProductCartBloc getProductCartBloc = GetProductCartBloc();
  GetDataCartBloc getDataCartBloc = GetDataCartBloc();

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

  streamData() async {
    List<OrderProductDTO> list = await cartViewModel();

    CustomAppBar.getLengthCartBloc.eventController.sink
        .add(AddItemToCartEvent(list.length));
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
    List<OrderProductDTO> orderProductList = [];

    await getProductCartBloc.getProductCartBloc();

    await getProductCartBloc.state.listen((state) {
      if (state is SuccessGetProductCartState) {
        orderProductList = state.list;
      } else if (state is ErrorGetProductCartState) {
        orderProductList = [];
      }
    });

    for (int i = 0; i < orderProductList.length; i++) {
      total += orderProductList[i].price ?? 0;
    }

    return total;
  }

  int cartLength() {
    int temp = 0;
    cartViewModel().then((value) {
      temp = value.length;
    });
    return temp;
  }
}
