import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/remote/response/category_response/category_items_response.dart';
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

abstract class GetCategoryState {}

class SuccessGetCategoryState extends GetCategoryState {
  List<CategoriesDTO> categoryList;

  SuccessGetCategoryState(this.categoryList);
}

class ErrorGetCategoryState extends GetCategoryState {
  String errorMessage;

  ErrorGetCategoryState(this.errorMessage);
}
