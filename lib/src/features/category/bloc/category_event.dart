abstract class CategoryEvent {}

class CategoryFilterEvent extends CategoryEvent {
  final int? manufacturerId;
  final int categoryId;
  final int no;
  final int limit;

  CategoryFilterEvent(this.manufacturerId, this.categoryId, this.no, this.limit);
}

class GetCategoryEvent extends CategoryEvent {
  final int no;
  final int limit;

  GetCategoryEvent(this.no, this.limit);
}

class GetManufacturerEvent extends CategoryEvent {
  final int no;
  final int limit;

  GetManufacturerEvent(this.no, this.limit);
}
