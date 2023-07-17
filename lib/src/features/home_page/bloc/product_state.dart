import 'package:mobile_store/src/core/model/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  
  final List<ProductDTO> products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState(this.errorMessage);
}
