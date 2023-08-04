import 'dart:async';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_bloc.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_event.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_state.dart';

class ProductViewModel {
  final ProductBloc _productBloc = ProductBloc();

  Future<List<ProductDTO>> getProducts() async {
    final productEvent = FetchProductEvent();
    List<ProductDTO> productList = [];

    Completer<List<ProductDTO>> completer = Completer<List<ProductDTO>>();

    await _productBloc.fetchProducts(productEvent);

    StreamSubscription<ProductState>? subscription;
    subscription = _productBloc.productListStream.listen((state) {
      if (state is ProductLoadedState) {
        productList = state.products;
        completer.complete(productList);
        subscription!
            .cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
      } else if (state is ProductErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel(); 
      }
    });
  
    return completer.future;
  }
}
