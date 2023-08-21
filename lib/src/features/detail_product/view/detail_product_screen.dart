import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';

import 'package:mobile_store/src/features/detail_product/widget/image_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/product_information.dart';

import '../../../core/model/review_dtos.dart';
import '../../../core/remote/response/review_response/review_response.dart';
import '../../review/view/rating_product.dart';
import '../../review/view/review_product.dart';
import '../../review/view_model/review_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final int idProduct;

  const ProductDetailScreen({
    Key? key,
    required this.idProduct,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  DetailProductViewModel detailProductViewModel = DetailProductViewModel();

  late ProductDTO product;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDTO>(
      future: detailProductViewModel.getDetailProduct(widget.idProduct),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            product = snapshot.data!;
            return buildUI(context);
          } else {
            return const Text('No products available');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageProduct(productDTO: product),
          RatingProduct(productDTO: product),
          // const ConfigurationProduct(),
          ProductInformation(productDTO: product),
          ReviewProduct(
            productId: widget.idProduct,
          ),
          // AnotherProduct(productId: widget.idProduct),
        ],
      )),
    );
  }
}
