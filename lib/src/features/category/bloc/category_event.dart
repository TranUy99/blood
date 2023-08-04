abstract class CategoryEvent{}

class CategoryFilterEvent extends CategoryEvent{
  final int categoryId;
  final int no;
  final int limit;

  CategoryFilterEvent(this.categoryId, this.no, this.limit);
}

class GetCategoryEvent {
  final int no;
  final int limit;

  GetCategoryEvent(this.no, this.limit);
}