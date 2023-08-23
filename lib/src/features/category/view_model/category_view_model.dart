import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/features/category/bloc/category_bloc.dart';
import 'package:mobile_store/src/features/category/bloc/category_event.dart';
import 'package:mobile_store/src/features/category/bloc/category_state.dart';

import '../../../core/model/manufacturer_dto.dart';

class CategoryViewModel {
  final CategoryFilterBloc _categoryFilterBloc = CategoryFilterBloc();

  Future<CategoryFilterResponse?> categoryFilterViewModel(int? manufacturerId,
      int categoryId, int? lowerPrice, int? higherPrice, int no, int limit) async {

    CategoryFilterResponse? categoryFilterResponse;
    await _categoryFilterBloc.categoryFilter(CategoryFilterEvent(
        manufacturerId, categoryId, lowerPrice, higherPrice, no, limit));

    await _categoryFilterBloc.state.listen((state) {
      if (state is SuccessCategoryFilterState) {
        categoryFilterResponse =
            successCategoryFilterState.categoryFilterResponse!;
      } else if (state is ErrorCategoryFilterState) {
        // print('Category filter failed');
      }
    });

    return categoryFilterResponse;
  }
}

class GetCategoryViewModel {
  GetCategoryBloc getCategoryBloc = GetCategoryBloc();
  List<CategoriesDTO>? categoryList = [];

  Future<List<CategoriesDTO>?> getCategoryViewModel(int no, int limit) async {
    await getCategoryBloc.addEvent(GetCategoryEvent(no, limit));

    try {
      await getCategoryBloc.state.listen((state) {
        if (state is SuccessGetCategoryState) {
          categoryList = state.categoryList;
        } else if (state is ErrorGetCategoryState) {
          categoryList = null;
        }
      });
    } catch (e) {
      print(e);
    }
    return categoryList;
  }
}

class GetManufacturerViewModel {
  GetManufacturerBloc getManufacturerBloc = GetManufacturerBloc();
  List<ManufacturerDTO>? manufacturerList = [];

  Future<List<ManufacturerDTO>?> getManufacturerViewModel(
      int no, int limit) async {
    await getManufacturerBloc.addEvent(GetManufacturerEvent(no, limit));

    try {
      await getManufacturerBloc.state.listen((state) {
        if (state is SuccessGetManufacturerState) {
          manufacturerList = state.manufacturerList;
        } else if (state is ErrorGetManufacturerState) {
          manufacturerList = null;
        }
      });
    } catch (e) {
      print(e);
    }
    return manufacturerList;
  }
}
