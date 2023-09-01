
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_event.dart';
import 'package:mobile_store/src/features/detail_product/bloc/detail_product_state.dart';
import 'package:mobile_store/src/features/detail_product/service/detail_product_service.dart';
import 'package:rxdart/rxdart.dart';

class DetailProductBloc {
  final BehaviorSubject<DetailProductState> _productStateSubject =
      BehaviorSubject<DetailProductState>();

  Stream<DetailProductState> get productListStream => _productStateSubject.stream;

  //get event product detail
  Future<void> getDetailProduct(GetDetailProductEvent event) async {
    try {
      final ProductDTO products = await DetailProductService.getDetailProductService(event.id);

      if (products != null) {
        _productStateSubject.sink.add(ProductLoadedState(products));
      } else {
        _productStateSubject.sink.add(ProductErrorState("No products available"));
      }
    } catch (e) {
      _productStateSubject.sink.add(ProductErrorState("Error fetching products"));
    }
  }

  //get event product detail
  Future<void> getRelatedProduct(GetRelatedProductEvent event) async {
    try {
      final List<ProductDTO> products =
          await DetailProductService.getRelatedProductService(event.id);

      if (products.isNotEmpty) {
        _productStateSubject.sink.add(RelatedProductLoadedState(products));
      } else {
        _productStateSubject.sink.add(RelatedProductErrorState("No products available"));
      }
    } catch (e) {
      _productStateSubject.sink.add(RelatedProductErrorState("Error fetching products"));
    }
  }

  void dispose() {}
}

class DetailProductCubit extends Cubit<DetailProductCubitState> {
  DetailProductCubit() : super(DetailProductCubitState());

  void reload() => emit(DetailProductCubitState());
}