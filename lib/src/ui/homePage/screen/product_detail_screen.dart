import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_appbar.dart';
import 'package:mobile_store/src/ui/homePage/widget/image_product.dart';
import 'package:mobile_store/src/ui/homePage/widget/name_product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

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
      body: const SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageProduct(),
          NameProduct(),
        ],
      )),
    );
  }
}
