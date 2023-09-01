import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:mobile_store/src/core/remote/response/search_response/search_response.dart';
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
      final products = await SearchService.getSearchService(event.keyword,event.no,event.limit);

      if (products.contents!.isNotEmpty) {
      
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
