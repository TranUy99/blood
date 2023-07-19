

import 'package:mobile_store/src/core/model/product.dart';

abstract class DetailProductState{}


class ProductInitialState extends DetailProductState {}

class ProductLoadingState extends DetailProductState {}

class ProductLoadedState extends DetailProductState {
  
  final ProductDTO product;
  ProductLoadedState(this.product);
}

class ProductErrorState extends DetailProductState {
  final String errorMessage;
  ProductErrorState(this.errorMessage);
}
