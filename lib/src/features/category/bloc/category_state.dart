import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/model/manufacturer_dto.dart';
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

abstract class GetManufacturerState {}

class SuccessGetManufacturerState extends GetManufacturerState {
  List<ManufacturerDTO> manufacturerList;

  SuccessGetManufacturerState(this.manufacturerList);
}

class ErrorGetManufacturerState extends GetManufacturerState {
  String errorMessage;

  ErrorGetManufacturerState(this.errorMessage);
}
