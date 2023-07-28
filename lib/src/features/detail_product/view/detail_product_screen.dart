import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';

import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';
import 'package:mobile_store/src/features/detail_product/widget/configuration_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/product_information.dart';
import 'package:mobile_store/src/features/detail_product/widget/review_product.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/detail_product/widget/image_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/name_product.dart';


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
            return Text('No products available');
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
          NameProduct(productDTO: product),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGreenColor,
                ),
                child: Text(
                  AppLocalizations.of(context)!.buyNow.toUpperCase(),
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const ConfigurationProduct(),
           ProductInformation(productDTO: product),
          const Review(),
          // const AnotherProduct(),
        ],
      )),
    );
  }
}
