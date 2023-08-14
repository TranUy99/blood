import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../main.dart';
import '../../../constant/api_outside/api_image.dart';
import '../../../core/model/product.dart';

class CartListView extends StatefulWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  final DetailProductViewModel detailProductViewModel =
      DetailProductViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getUser.cartBox?.length,
      itemBuilder: (context, index) {
        ProductDetailCart productDetailCart = getUser.cartBox?.getAt(index);
        return FutureBuilder(
          future: detailProductViewModel
              .getDetailProduct(productDetailCart.productID),
          builder: (BuildContext context, AsyncSnapshot<ProductDTO> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CachedNetworkImage(
                          imageUrl: ApiImage().generateImageUrl(
                              '${snapshot.data!.imageDTOs?[0].name}'),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${snapshot.data?.name}'),
                            Text('${snapshot.data?.price}'),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                    setState(() {
                                      getUser.cartBox?.putAt(
                                          index,
                                          ProductDetailCart(
                                              productID: productDetailCart.productID ?? 0,
                                              productQuantity: productDetailCart.productQuantity - 1));
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all()),
                                    child: Text('-'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(border: Border.all()),
                                  child:
                                  Text('${productDetailCart.productQuantity}'),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      getUser.cartBox?.putAt(
                                          index,
                                          ProductDetailCart(
                                              productID: productDetailCart.productID ?? 0,
                                              productQuantity: productDetailCart.productQuantity + 1));
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all()),
                                    child: Text('+'),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      getUser.cartBox?.deleteAt(index);
                                      setState(() {});
                                      showTopSnackBar(
                                          Overlay.of(context),
                                          const CustomSnackBar.success(
                                              message: 'Delete item successfully'));
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      )
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
    );
  }
}
