

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/view/detail_product_screen.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_bloc.dart';
import '../../../constant/api_outside/api_image.dart';
import '../view_model/detail_product_view_model.dart';

class AnotherProduct extends StatefulWidget {
  final int productId;
  const AnotherProduct({super.key, required this.productId});

  @override
  State<AnotherProduct> createState() => _AnotherProductState();
}

class _AnotherProductState extends State<AnotherProduct> {
  late ProductBloc productBloc;
  List<ProductDTO> products = [];
  DetailProductViewModel detailProductViewModel = DetailProductViewModel();
  @override
  void initState() {
    super.initState();
    productBloc = ProductBloc();
  }

  @override
  void dispose() {
    productBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductDTO>>(
      future: detailProductViewModel.getRelatedProduct(widget.productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          if (snapshot.hasData) {
            products = snapshot.data!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return const Text('No products available');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
  
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Scrollbar(
            thickness: 8.0,
            radius: const Radius.circular(20.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
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
                            idProduct: product.id!
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: CachedNetworkImage(
                                imageUrl:
                                    ApiImage().generateImageUrl('${product.imageDTOs![0].name}'),
                                height: 20,
                              ),
                            ),
                            Column(
                              children: [
                                Text('${product.name}',
                                    style: const TextStyle(
                                        fontSize: 20, color: kRedColor, fontFamily: 'sans-serif')),
                                Text('${product.price}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: kGreenColor,
                                        fontFamily: 'sans-serif')),
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
