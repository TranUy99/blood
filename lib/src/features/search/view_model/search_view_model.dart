import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/search/bloc/search_bloc.dart';

class SearchViewModel {
  final SearchBloc _searchBloc = SearchBloc();

  Future<List<ProductDTO>> searchProduct(String keywords) async {
    List<ProductDTO> productList = [];
    try {
      final productEvent = SearchNameEvent(keywords);
      await _searchBloc.searchProducts(productEvent);

      Completer<List<ProductDTO>> completer = Completer<List<ProductDTO>>();
      StreamSubscription<SearchState>? subscription;

      subscription = _searchBloc.productListStream.listen((state) {
        if (state is SuccessSearchListProduct) {
          productList = state.products;
          completer.complete(productList);
          subscription!.cancel(); // Hủy lắng nghe sau khi nhận được danh sách sản phẩm
        } else if (state is FailedSearchListProduct) {
          completer.completeError('Error fetching products');
          subscription!.cancel(); // Hủy lắng nghe nếu có lỗi xảy ra
        }
      });
     
      return completer.future;
    } catch (e) {
      throw Exception("Error fetching products");
    }
  }
}
