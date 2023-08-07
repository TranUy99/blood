import 'dart:async';
import 'package:mobile_store/src/core/remote/response/search_response/search_response.dart';
import 'package:mobile_store/src/features/search/bloc/search_bloc.dart';

class SearchViewModel {
  final SearchBloc _searchBloc = SearchBloc();

  Future<SearchResponse?> searchProduct(String keywords, int no, int limit) async {
    SearchResponse? searchResponse;
    try {
      final productEvent = SearchNameEvent(keywords, no, limit);
      await _searchBloc.searchProducts(productEvent);
     
      await _searchBloc.productListStream.listen((state) {
        if (state is SuccessSearchListProduct) {
          searchResponse = state.products;
        } else if (state is FailedSearchListProduct) {}
      });

      return searchResponse;
    } catch (e) {
      throw Exception("Error fetching products");
    }
  }
}
