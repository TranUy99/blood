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
        price: 1099,
      
      ),
      ProductDTO(
        id: 2,
        name: 'IPhone 14 Pro ',
        price: 1000,
       
      ),
      ProductDTO(
        id: 3,
        name: 'IPhone 14 Pro1',
        price: 2000 ,
      
      )
    ];
    _productListController.add(products);
  }

  void dispose() {
    _productListController.close();
  }
}



