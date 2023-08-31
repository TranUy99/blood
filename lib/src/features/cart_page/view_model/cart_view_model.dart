import 'package:flutter/cupertino.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../main.dart';
import '../../../core/model/product.dart';
import '../../component/custom_app_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartViewModel {
  final GetProductCartBloc getProductCartBloc = GetProductCartBloc();
  final GetDataCartBloc getDataCartBloc = GetDataCartBloc();
  final DetailProductBloc _detailProductBloc = DetailProductBloc();
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

  addToCart(BuildContext context, String? selectedOption, String? selectedColor,
      ProductDTO productDTO) {
    int? flag;
    String? memory;
    String? color;
    List<ProductDetailCart> cartList = [];

    for (int i = 0; i < getUser.cartBox!.length; i++) {
      ProductDetailCart product = getUser.cartBox?.getAt(i);
      cartList.add(product);
      if (productDTO.id == product.productID &&
          selectedOption == product.memory &&
          selectedColor == product.color) {
        flag = i;
        memory = selectedOption;
        color = selectedColor;
      }
    }
    if (flag == null && memory == null && color == null) {
      cartList.insert(
          0,
          ProductDetailCart(
              productID: productDTO.id ?? 0,
              productQuantity: 1,
              memory: selectedOption,
              color: selectedColor,
              stock: productDTO.stocks));
      getUser.cartBox?.deleteAll(getUser.cartBox!.keys);
      getUser.cartBox?.addAll(cartList);
    } else {
      ProductDetailCart product = getUser.cartBox?.getAt(flag ?? 0);
      getUser.cartBox?.putAt(
          flag ?? 0,
          ProductDetailCart(
              productID: productDTO.id ?? 0,
              productQuantity: product.productQuantity + 1,
              memory: product.memory,
              color: product.color,
              stock: productDTO.stocks));
    }
    streamLengthCartList();
  }

  streamLengthCartList() async {
    List<OrderProductDTO> list = await cartViewModel();

    CustomAppBar.cartBloc.eventController.sink.add(GetLengthCartEvent(list.length));
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
