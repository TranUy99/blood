import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';

abstract class CategoryFilterState {}

class SuccessCategoryFilterState extends CategoryFilterState {
  CategoryFilterResponse? categoryFilterResponse;
  SuccessCategoryFilterState(this.categoryFilterResponse);
}

class ErrorCategoryFilterState extends CategoryFilterState {
  String errorMessage;
  ErrorCategoryFilterState(this.errorMessage);
}
