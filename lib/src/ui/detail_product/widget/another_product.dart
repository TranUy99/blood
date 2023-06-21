import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/ui/detail_product/screen/product_detail_screen.dart';
import 'package:mobile_store/src/ui/homePage/bloc/product_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnotherProduct extends StatefulWidget {
  const AnotherProduct({
    super.key,
  });

  @override
  State<AnotherProduct> createState() => _AnotherProductState();
}

class _AnotherProductState extends State<AnotherProduct> {
  late ProductBloc productBloc;
  List<ProductDTO> products = [];

  @override
  void initState() {
    super.initState();
    productBloc = ProductBloc(); // Khởi tạo đối tượng ProductBloc
    productBloc.fetchProducts(); // Gọi phương thức fetchProducts() để lấy dữ liệu sản phẩm
  }

  @override
  void dispose() {
    productBloc.dispose(); // Hủy bỏ đối tượng ProductBloc khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductDTO>>(
      stream: productBloc.productListStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          products = snapshot.data!;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return buildUI(context);
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.news,
                style: const TextStyle(
                  fontSize: 20,
                  color: kRedColor,
                  fontFamily: 'sans-serif',
                ),
              ),
              const Image(
                image: AssetImage('images/fire.png'),
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Scrollbar(
            thickness: 8.0,
            radius: const  Radius.circular(20.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Hướng cuộn ngang
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5, // Đặt kích thước cho mỗi sản phẩm
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: kZambeziColor,
                        width: 2.0,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            productDTO: product,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: Image(
                                image: AssetImage(product.image!),
                                height: 20,
                              ),
                            ),
                            Column(
                              children: [
                                Text('${product.name}', style: const TextStyle(fontSize: 20, color: kRedColor, fontFamily: 'sans-serif')),
                                Text('${product.price}', style: const TextStyle(fontSize: 20, color: kGreenColor, fontFamily: 'sans-serif')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
