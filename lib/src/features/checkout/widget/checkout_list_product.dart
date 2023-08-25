import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';

import '../../../../main.dart';
import '../../../constant/api_outside/api_image.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/product.dart';

class CheckoutList extends StatefulWidget {
  final double? totalAmount;
  final Function(double?) totalAmountSelected;
  CheckoutList({Key? key, required this.totalAmount, required this.totalAmountSelected})
      : super(key: key);

  @override
  State<CheckoutList> createState() => _CheckoutListViewState();
}

class _CheckoutListViewState extends State<CheckoutList> {
  final DetailProductViewModel detailProductViewModel = DetailProductViewModel();
  static double totalAmount = 0;
  @override
  void initState() {
    super.initState();
    _calculateTotalAmount();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _calculateTotalAmount() async {
    double calculatedTotalAmount = 0;

    for (int index = 0; index < getUser.cartBox!.length; index++) {
      ProductDetailCart productDetailCart = getUser.cartBox?.getAt(index);
      ProductDTO product =
          await detailProductViewModel.getDetailProduct(productDetailCart.productID);

      double productPrice = product.price! * productDetailCart.productQuantity;
      calculatedTotalAmount += productPrice;
    }

    setState(() {
      totalAmount = calculatedTotalAmount;
    });
    widget.totalAmountSelected(totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getUser.cartBox?.length,
        itemBuilder: (context, index) {
          ProductDetailCart productDetailCart = getUser.cartBox?.getAt(index);

          return FutureBuilder(
            future: detailProductViewModel.getDetailProduct(productDetailCart.productID),
            builder: (BuildContext context, AsyncSnapshot<ProductDTO> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: CachedNetworkImage(
                            imageUrl:
                                ApiImage().generateImageUrl('${snapshot.data!.imageDTOs?[0].name}'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data!.name}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${productDetailCart.color}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: kGreyColor,
                              ),
                            ),
                            Text(
                              'Quantity: ${productDetailCart.productQuantity}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: kGreyColor,
                              ),
                            ),
                            Text(
                              'Price: ${NumberFormat('#,###.###').format(snapshot.data!.price! * productDetailCart.productQuantity)} VND',
                              style: const TextStyle(
                                fontSize: 14,
                                color: kGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text('No products available');
                }
              }
            },
          );
        },
      ),
    
    ]);
  }
}
