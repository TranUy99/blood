import 'dart:async';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_bloc.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_event.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_state.dart';

class DetailProductViewModel {
  final DetailProductBloc _detailProductBloc = DetailProductBloc();

  //Get detail product
  Future<ProductDTO> getDetailProduct(int id) async {
    final getDetailProductEvent = GetDetailProductEvent(id);
    ProductDTO productList;
    //add event
    await _detailProductBloc.getDetailProduct(getDetailProductEvent);
    Completer<ProductDTO> completer = Completer<ProductDTO>();

    await _detailProductBloc.getDetailProduct(getDetailProductEvent);

    StreamSubscription<DetailProductState>? subscription;
    subscription = _detailProductBloc.productListStream.listen((state) {
      if (state is ProductLoadedState) {
        productList = state.product;
        completer.complete(productList);
        subscription!.cancel();
      } else if (state is ProductErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

  //Get detail product
  Future<List<ProductDTO>> getRelatedProduct(int id) async {
    final getRelatedProductEvent = GetRelatedProductEvent(id);
    List<ProductDTO> productList;
    //add event
    await _detailProductBloc.getRelatedProduct(getRelatedProductEvent);
    Completer<List<ProductDTO>> completer = Completer<List<ProductDTO>>();

    await _detailProductBloc.getRelatedProduct(getRelatedProductEvent);

    StreamSubscription<DetailProductState>? subscription;
    subscription = _detailProductBloc.productListStream.listen((state) {
      if (state is RelatedProductLoadedState) {
        productList = state.relatedProduct;
        completer.complete(productList);
        subscription!.cancel();
      } else if (state is RelatedProductErrorState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }
}
