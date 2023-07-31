import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_bloc.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_event.dart';
import 'package:mobile_store/src/features/category/bloc_state/category_state.dart';

class CategoryViewModel {
  final CategoryFilterBloc _categoryFilterBloc = CategoryFilterBloc();

  Future<CategoryFilterResponse?> categoryFilterViewModel(
      int categoryId, int no, int limit) async {
    CategoryFilterResponse? categoryFilterResponse;
    await _categoryFilterBloc
        .addEvent(CategoryFilterEvent(categoryId, no, limit));

    await _categoryFilterBloc.state.listen((state) {
      if (state is SuccessCategoryFilterState) {
        categoryFilterResponse =
            successCategoryFilterState.categoryFilterResponse!;
      } else if (state is ErrorCategoryFilterState) {
        print('Category filter failed');
      }
    });

    return categoryFilterResponse;
  }
}
