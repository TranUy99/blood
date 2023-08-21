import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../main.dart';
import '../../../constant/api_outside/api_image.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/order_product_dto.dart';
import '../../component/custom_app_bar.dart';
import '../bloc/cart_event.dart';

class CartListView extends StatefulWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  final DetailProductViewModel detailProductViewModel =
      DetailProductViewModel();
  final textCurrency = NumberFormat("#,###.###", "en_US");
  List<OrderProductDTO> cartList = [];
  CartViewModel cartViewModel = CartViewModel();
  bool isReload = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cartViewModel.getDataCartViewModel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && isReload) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
              isReload = false;
            if(snapshot.data!.isNotEmpty){
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getUser.cartBox?.length,
                itemBuilder: (context, index) {
                  ProductDetailCart productDetailCart =
                      getUser.cartBox?.getAt(index);
                  ProductDTO productDTO = snapshot.data![index];

                  return cartItem(productDTO, productDetailCart, index);
                },
              );
            } else{
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: const Center(child: Text('Cart is empty')),
              );
            }
          } else {
            return const Text('No products available');
          }
        }
      },
    );
  }

  Widget cartItem(ProductDTO productDTO, ProductDetailCart productDetailCart, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.35,
            width: MediaQuery.of(context).size.width * 0.35,
            child: CachedNetworkImage(
              imageUrl: ApiImage().generateImageUrl('${productDTO.imageDTOs?[0].name}'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 5),
            width: MediaQuery.of(context).size.width * 0.58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    '${productDTO.name}',
                    style: const TextStyle(fontSize: 20, color: kRedColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${textCurrency.format(productDTO.price)} đ',
                    style: const TextStyle(color: kGreenColor, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${productDetailCart.memory} | ${productDetailCart.color}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (productDetailCart.productQuantity > 1) {
                          setState(() {
                            getUser.cartBox?.putAt(
                                index,
                                ProductDetailCart(
                                    productID: productDetailCart.productID,
                                    productQuantity:
                                        productDetailCart.productQuantity - 1,
                                    memory: productDetailCart.memory,
                                    color: productDetailCart.color,
                                    stock: productDetailCart.stock));
                          });
                        }
                        cartViewModel.streamData();
                      },
                      child: Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Center(
                            child: Text(
                          '-',
                          style: TextStyle(fontSize: 25),
                        )),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 40,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                          child: Text('${productDetailCart.productQuantity}')),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (productDetailCart.productQuantity <
                              (productDetailCart.stock)!) {
                            getUser.cartBox?.putAt(
                                index,
                                ProductDetailCart(
                                    productID: productDetailCart.productID,
                                    productQuantity:
                                        productDetailCart.productQuantity + 1,
                                    memory: productDetailCart.memory,
                                    color: productDetailCart.color,
                                    stock: productDetailCart.stock));
                          }
                          cartViewModel.streamData();
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Center(
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {

                          setState(() {
                            getUser.cartBox?.deleteAt(index);
                            cartViewModel.streamData();
                            showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                    message: 'Delete item successfully'));
                          });

                        },
                        icon: const Icon(Icons.delete))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
