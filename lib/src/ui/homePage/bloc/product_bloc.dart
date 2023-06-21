import 'dart:async';

import 'package:mobile_store/src/core/model/product.dart';

class ProductBloc {
  final _productListController = StreamController<List<ProductDTO>>();
  Stream<List<ProductDTO>> get productListStream => _productListController.stream;

  void fetchProducts() {
    final List<ProductDTO> products = [
      ProductDTO(
        id: 1,
        name: 'IPhone 14 Pro Max',
        price: '1099 USD',
        image: 'images/iphone14.jpg',
      ),
      ProductDTO(
        id: 2,
        name: 'IPhone 14 Pro ',
        price: '1000 USD',
        image: 'images/iphone14.jpg',
      ),
      ProductDTO(
        id: 3,
        name: 'IPhone 14 Pro1',
        price: '1099 USD',
        image: 'images/iphone14.jpg',
      )
    ];
    _productListController.add(products);
  }

  void dispose() {
    _productListController.close();
  }
}
// class ProductBloc {
//   final _productListController = StreamController<List<ProductDTO>>.broadcast();
//   Stream<List<ProductDTO>> get productListStream => _productListController.stream;

//   void fetchProducts() async {
//     // Simulate fetching data from an API or database
//     final List<ProductDTO> products = await someAPI.fetchProducts();
//     _productListController.add(products);
//   }

//   void dispose() {
//     _productListController.close();
//   }
// }