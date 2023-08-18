import 'dart:async';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../../../core/model/order_product_dto.dart';
import '../../../core/model/product_detail_cart.dart';
import '../../detail_product/service/detail_product_service.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class GetProductCartBloc {
  ProductDTO? productDTO;
  List<OrderProductDTO> orderProductDTOList = [];
  final BehaviorSubject<GetProductCartState> _productStateSubject =
      BehaviorSubject<GetProductCartState>();


  Stream<GetProductCartState> get state => _productStateSubject.stream;

  Future<void> getProductCartBloc() async {
    orderProductDTOList = [];

    for (int i = 0; i < getUser.cartBox!.length; i++) {
      ProductDetailCart productDetailCart = getUser.cartBox?.getAt(i);
      productDTO = await DetailProductService.getDetailProductService(productDetailCart.productID);
      for (int j = productDetailCart.productQuantity; j > 0; j--) {
        orderProductDTOList.add(OrderProductDTO(
              id: productDetailCart.productID,
              name: productDTO?.name,
              color: productDetailCart.color,
              memory: productDetailCart.memory,
              price: productDTO?.price,
              description: productDTO?.description,
              image: productDTO!.imageDTOs?[0].name,
        ));
      }
    }


    if (orderProductDTOList.isNotEmpty) {
      _productStateSubject.add(SuccessGetProductCartState(orderProductDTOList));
    } else {
      _productStateSubject.add(ErrorGetProductCartState('Can not get data'));
    }
  }


}

class GetDataCartBloc {
  final BehaviorSubject<GetDataCartState> _productStateSubject =
  BehaviorSubject<GetDataCartState>();


  Stream<GetDataCartState> get state => _productStateSubject.stream;

  Future<void> getDataBloc() async {
    List<ProductDTO> listTemp = [];

    for(int i=0; i<getUser.cartBox!.length; i++){
      ProductDetailCart productDetailCart = getUser.cartBox?.getAt(i);
      final productResult = await DetailProductService.getDetailProductService(
          productDetailCart.productID);
      listTemp.add(productResult);
    }

    if(listTemp != []){
      _productStateSubject.add(SuccessGetDataCartState(listTemp));
    }else{
      _productStateSubject.add(ErrorGetDataCartState());
    }

  }

}

class GetLengthCartBloc {
  var state = GetLengthCartState(getUser.cartBox!.length);
  final eventController = StreamController<GetLengthCartEvent>();
  final stateController = StreamController<GetLengthCartState>.broadcast();

  GetLengthCartBloc() {
    eventController.stream.listen((GetLengthCartEvent event) {
      if (event is AddItemToCartEvent) {
        state = GetLengthCartState(event.addToCartList);
      }
      stateController.sink.add(state);
    });
  }
}
