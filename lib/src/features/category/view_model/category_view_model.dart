import 'package:mobile_store/src/features/category/service/category_service.dart';

class CategoryViewModel {
  CategoryService categoryService = CategoryService();
  Future<void> categoryFilter (int manufacturerId, int no, int limit) async {
    categoryService.categoryService(manufacturerId, no, limit).then((value) {
      print(value.contents?[1].categoriesDTO?.name);
    });
  }
}
