import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/model/product_filter.dart';
import 'package:mobile_store/src/core/remote/response/category_response/category_items_response.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_event.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_state.dart';
import 'package:mobile_store/src/features/category/service/category_filter_service.dart';
import 'package:mobile_store/src/features/category/service/get_category_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class CategoryBloc{}

SuccessCategoryFilterState successCategoryFilterState =
    SuccessCategoryFilterState(null);

class CategoryFilterBloc extends CategoryBloc {
  final _stateController = BehaviorSubject<CategoryFilterState>();

  Stream<CategoryFilterState> get state => _stateController.stream;
  int? totalItems;
  String? message;
  List<ProductFilter>? productList = [];

  Future<void> addEvent(CategoryFilterEvent event) async {
    await _categoryFilter(event.categoryId, event.no, event.limit);
  }

  Future<void> _categoryFilter(int categoryId, int no, int limit) async {
    final categoryFilterResult =
        CategoryFilterService().categoryFilterService(categoryId, no, limit);
    try {
      await categoryFilterResult.then((value) {
        productList = value.contents;
        totalItems = value.totalItems;
      });
    } catch (e) {
      message = e.toString();
    }

    if (totalItems != 0) {
      _stateController.add(successCategoryFilterState =
          SuccessCategoryFilterState(await categoryFilterResult));
    } else {
      _stateController.add(ErrorCategoryFilterState(
          (message == null) ? 'Empty List' : message!));
    }
  }

  void dispose() {
    _stateController.close();
  }
}

class GetCategoryBloc extends CategoryBloc {
  final _stateController = BehaviorSubject<GetCategoryState>();

  Stream<GetCategoryState> get state => _stateController.stream;
  int? totalItems;
  String? error;
  String? message;
  List<CategoriesDTO>? categoryList = [];

  Future<Future<List<CategoriesDTO>?>> addEvent(GetCategoryEvent event) async {
    return _getCategory(event.no, event.limit);
  }

  Future<List<CategoriesDTO>?> _getCategory(int no, int limit) async {
    final getCategoryResult =
    GetCategoryService().getCategoryService(no, limit);
    try {
      await getCategoryResult.then((value) {
        categoryList = value.contents;
        totalItems = value.totalItems;
      });
    } catch (e) {
      message = e.toString();
    }

    if (totalItems != 0) {
      _stateController.add(SuccessGetCategoryState(categoryList ?? []));
    } else {
      _stateController.add(ErrorGetCategoryState(message ?? ''));
    }
    return await categoryList;
  }

  void dispose() {
    _stateController.close();
  }
}