import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/search/service/search_service.dart';
import 'package:rxdart/rxdart.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc {
  final BehaviorSubject<SearchState> _productStateSubject = BehaviorSubject<SearchState>();

  Stream<SearchState> get productListStream => _productStateSubject.stream;

  //Get product and add state
  Future<void> searchProducts(SearchNameEvent event) async {
    _productStateSubject.sink.add(SearchInitial());

    try {
      final List<ProductDTO> products = await SearchService.getSearchService(event.keyword);

      if (products.isNotEmpty) {
      
        _productStateSubject.sink.add(SuccessSearchListProduct(products));
      } else {
        _productStateSubject.sink.add(const FailedSearchListProduct("No products available"));
      }
    } catch (e) {
      _productStateSubject.sink.add(const FailedSearchListProduct("Error fetching products"));
    }
  }

  void dispose() {

  }
}
