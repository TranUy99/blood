import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/widget/another_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/configuration_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/product_information.dart';
import 'package:mobile_store/src/features/detail_product/widget/review_product.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/detail_product/widget/image_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/name_product.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDTO productDTO;

  const ProductDetailScreen({
    Key? key,
    required this.productDTO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageProduct(),
              NameProduct(productDTO: productDTO),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your code to handle the button press here.
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
              const ProductInformation(),
              const Review(),
              const AnotherProduct(),
            ],
          )),
    );
  }
}
