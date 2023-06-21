import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/ui/detail_product/widget/another_product.dart';
import 'package:mobile_store/src/ui/detail_product/widget/configuration_product.dart';
import 'package:mobile_store/src/ui/detail_product/widget/product_information.dart';
import 'package:mobile_store/src/ui/detail_product/widget/review_product.dart';

import 'package:mobile_store/src/ui/homePage/widget/custom_app_bar.dart';
import 'package:mobile_store/src/ui/detail_product/widget/image_product.dart';
import 'package:mobile_store/src/ui/detail_product/widget/name_product.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDTO productDTO;

  const ProductDetailScreen({Key? key, required this.productDTO,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
            backgroundColor: kSecondaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: const CustomAppBar()),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageProduct(),
            NameProduct(productDTO: productDTO),
            const ConfigurationProduct(),
            const ProductInformation(),
            const Review(),
             AnotherProduct(),
          ],
        ),
      )),
    );
  }
}
