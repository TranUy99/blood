import 'package:hive/hive.dart';

part 'product_detail_cart.g.dart';

@HiveType(typeId: 0)
class ProductDetailCart {
  @HiveField(0)
  final int productID;

  @HiveField(1)
  final int productQuantity;

  @HiveField(2)
  final String? memory;

  @HiveField(3)
  final String? color;

  @HiveField(4)
  final int? stock;

  ProductDetailCart(
      {required this.productID,
      required this.productQuantity,
      required this.memory,
      required this.color,
      required this.stock});
}
