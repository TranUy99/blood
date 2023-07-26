import 'package:mobile_store/src/core/model/product_filter.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_event.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_state.dart';
import 'package:mobile_store/src/features/category/service/category_filter_service.dart';
import 'package:rxdart/rxdart.dart';

SuccessCategoryFilterState successCategoryFilterState =
    SuccessCategoryFilterState(null);

class CategoryFilterBloc {
  final _stateController = BehaviorSubject<CategoryFilterState>();

  Stream<CategoryFilterState> get state => _stateController.stream;

  String? message;
  List<ProductFilter>? productList = [];

  Future<void> addEvent(CategoryFilterEvent event) async {
    _categoryFilter(event.categoryId, event.no, event.limit);
  }

  Future<void> _categoryFilter(int categoryId, int no, int limit) async {
    final categoryFilterResult =
        CategoryFilterService().categoryFilterService(categoryId, no, limit);
    try {
      await categoryFilterResult.then((value) {
        productList = value.contents;
      });
    } catch (e) {
      message = e.toString();
    }

    print('bloc ${productList?[0].categoriesDTO?.id}');

    if (productList != []) {
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
