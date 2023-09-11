

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  

}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState(this.errorMessage);
}
