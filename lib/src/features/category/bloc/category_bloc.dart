import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/core/model/manufacturer_dto.dart';
import 'package:mobile_store/src/core/model/product_filter.dart';
import 'package:mobile_store/src/features/category/service/category_filter_service.dart';
import 'package:mobile_store/src/features/category/service/get_category_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service/get_manufacturer_service.dart';
import 'category_event.dart';
import 'category_state.dart';

abstract class CategoryBloc {}

SuccessCategoryFilterState successCategoryFilterState =
    SuccessCategoryFilterState(null);

class CategoryFilterBloc extends CategoryBloc {
  final _stateController = BehaviorSubject<CategoryFilterState>();

  Stream<CategoryFilterState> get state => _stateController.stream;
  int? totalItems;
  String? message;
  List<ProductFilter>? productList = [];

  Future<void> categoryFilter(CategoryFilterEvent event) async {
    final categoryFilterResult = CategoryFilterService().categoryFilterService(
      event.manufacturerId,
      event.categoryId,
      '',
      event.lowerPrice,
      event.higherPrice,
      event.no,
      event.limit,
    );
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

  Future<List<CategoriesDTO>?> addEvent(GetCategoryEvent event) async {
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
      _stateController.add(SuccessGetCategoryState(categoryList!));
    } else {
      _stateController.add(ErrorGetCategoryState(message ?? ''));
    }
    return categoryList;
  }

  void dispose() {
    _stateController.close();
  }
}

class GetManufacturerBloc extends CategoryBloc {
  final _stateController = BehaviorSubject<GetManufacturerState>();

  Stream<GetManufacturerState> get state => _stateController.stream;
  int? totalItems;
  String? error;
  String? message;
  List<ManufacturerDTO>? manufacturerList = [];

  Future<List<ManufacturerDTO>?> addEvent(GetManufacturerEvent event) async {
    return _getManufacturer(event.no, event.limit);
  }

  Future<List<ManufacturerDTO>?> _getManufacturer(int no, int limit) async {
    final getManufacturerResult =
        GetManufacturerService().getManufacturerService(no, limit);
    try {
      await getManufacturerResult.then((value) {
        manufacturerList = value.contents;
        totalItems = value.totalItems;
      });
    } catch (e) {
      message = e.toString();
    }
    if (totalItems != 0) {
      _stateController.add(SuccessGetManufacturerState(manufacturerList!));
    } else {
      _stateController.add(ErrorGetManufacturerState(message ?? ''));
    }
    return manufacturerList;
  }

  void dispose() {
    _stateController.close();
  }
}
