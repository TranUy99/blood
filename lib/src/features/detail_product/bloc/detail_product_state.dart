import 'package:mobile_store/src/core/model/product.dart';

abstract class DetailProductState {}

class ProductInitialState extends DetailProductState {}

class ProductLoadingState extends DetailProductState {}

//Loading state success
class ProductLoadedState extends DetailProductState {
  final ProductDTO product;

  ProductLoadedState(this.product);
}

//Loading state failed
class ProductErrorState extends DetailProductState {
  final String errorMessage;

  ProductErrorState(this.errorMessage);
}


//Loading state success
class RelatedProductLoadedState extends DetailProductState {
  final List<ProductDTO> relatedProduct;

  RelatedProductLoadedState(this.relatedProduct);
}

//Loading state failed
class RelatedProductErrorState extends DetailProductState {
  final String errorMessage;

  RelatedProductErrorState(this.errorMessage);
}

class DetailProductCubitState {}
