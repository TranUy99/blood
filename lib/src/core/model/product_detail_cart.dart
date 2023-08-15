import 'package:hive/hive.dart';

part 'product_detail_cart.g.dart';

@HiveType(typeId: 0)
class ProductDetailCart {
  @HiveField(0)
  final int productID;

  @HiveField(1)
  final int productQuantity;

  ProductDetailCart({required this.productID, required this.productQuantity});
}
