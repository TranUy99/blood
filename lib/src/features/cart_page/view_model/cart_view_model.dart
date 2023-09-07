import 'package:flutter/cupertino.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';

import '../../../../main.dart';
import '../../../core/model/product.dart';
import '../../component/custom_app_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

enum StatusAddToCart{successfully, maximumInStock}

class CartViewModel {
  final GetProductCartBloc getProductCartBloc = GetProductCartBloc();
  final GetDataCartBloc getDataCartBloc = GetDataCartBloc();
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

  int addToCart(BuildContext context, String? selectedOption,
      String? selectedColor, ProductDTO productDTO) {
    int status = StatusAddToCart.successfully.index;
    int? indexCartProduct;
    String? memory;
    String? color;
    List<ProductDetailCart> cartList = [];

    //Kiểm tra sản phẩm có trong giỏ hàng hay chưa
    for (int i = 0; i < getUser.cartBox!.length; i++) {
      ProductDetailCart product = getUser.cartBox?.getAt(i);
      cartList.add(product);
      if (productDTO.id == product.productID &&
          selectedOption == product.memory &&
          selectedColor == product.color) {
        indexCartProduct = i;
        memory = selectedOption;
        color = selectedColor;
      }
    }
    //Khi chưa có sản phẩm trong giỏ hàng
    if (indexCartProduct == null && memory == null && color == null) {
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
      status = StatusAddToCart.successfully.index;
    } else {
      //Khi đã có sản phẩm
      ProductDetailCart product = getUser.cartBox?.getAt(indexCartProduct ?? 0);
      if (product.stock! > product.productQuantity) {
        getUser.cartBox?.putAt(
            indexCartProduct ?? 0,
            ProductDetailCart(
                productID: productDTO.id ?? 0,
                productQuantity: product.productQuantity + 1,
                memory: product.memory,
                color: product.color,
                stock: productDTO.stocks));
        status = StatusAddToCart.successfully.index;
      } else {
        status = StatusAddToCart.maximumInStock.index;
      }
    }
    streamLengthCartList();
    return status;
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
