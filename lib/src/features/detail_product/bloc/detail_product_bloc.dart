
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_event.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_state.dart';
import 'package:mobile_store/src/features/detail_product/service/detail_product_service.dart';
import 'package:rxdart/rxdart.dart';

class DetailProductBloc{
   final BehaviorSubject<DetailProductState> _productStateSubject = BehaviorSubject<DetailProductState>();

  Stream<DetailProductState> get productListStream => _productStateSubject.stream;

  Future<void>getDetailProduct(GetDetailProductEvent event)async {

 try {
    final ProductDTO products = await DetailProductService.getDetailProductService(event.id);

    if (products !=null) {
      _productStateSubject.sink.add(ProductLoadedState(products));
      
    } else {
      _productStateSubject.sink.add(ProductErrorState("No products available"));
    }
  } catch (e) {
    _productStateSubject.sink.add(ProductErrorState("Error fetching products"));
  }
}


  void dispose() {}

}
