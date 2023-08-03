part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SuccessSearchListProduct extends SearchState {
    final SearchResponse products;
  const SuccessSearchListProduct(this.products);
}

class FailedSearchListProduct extends SearchState {
   final String errorMessage;
  const FailedSearchListProduct(this.errorMessage);
}
