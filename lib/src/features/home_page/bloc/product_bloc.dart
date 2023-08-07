import 'dart:async';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_event.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_state.dart';
import 'package:mobile_store/src/features/home_page/service/product_service.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final BehaviorSubject<ProductState> _productStateSubject =
      BehaviorSubject<ProductState>();

  Stream<ProductState> get productListStream => _productStateSubject.stream;

  //Get product and add state
  Future<void> fetchProducts(FetchProductEvent event) async {
    _productStateSubject.sink.add(ProductLoadingState());

    try {
      final List<ProductDTO> products =
          await ProductService.getProductService();

      if (products.isNotEmpty) {
        _productStateSubject.sink.add(ProductLoadedState(products));
      } else {
        _productStateSubject.sink
            .add(ProductErrorState("No products available"));
      }
    } catch (e) {
      _productStateSubject.sink
          .add(ProductErrorState("Error fetching products"));
    }
  }

  void dispose() {}
}
