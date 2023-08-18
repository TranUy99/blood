import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/cart_page/widget/cart_list_view.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';

import '../../../core/model/order_product_dto.dart';
import '../widget/cart_selecte_address.dart';
import '../widget/cart_selecte_promotion.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedAddressIndex = 0;
  int selectedPromotionIndex = 0;
  List<OrderProductDTO> orderProductDTOList = [];
  CartViewModel cartViewModel = CartViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartListView(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.temporaryprice,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    FutureBuilder<double>(
                      future: CartViewModel().totalPay(),
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: kGreenColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
// selected address
            SelectedAddressCart(
              selectedAddressIndex: selectedAddressIndex!,
              onAddressSelected: (int index) {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
            ),

// Add another address ,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddAddressScreen();
                    },
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.anotherAddress,
                  style: const TextStyle(
                    fontSize: 14,
                    color: kGreenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

// selected promotion,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectedPromotionCard(
                selectedPromotionIndex: selectedPromotionIndex,
                onAddressSelected: (int? index) {
                  setState(() {
                    selectedPromotionIndex = index!;
                  });
                },
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.total,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      '3297 USD',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kGreenColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationHomePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: Text(
                    AppLocalizations.of(context)!.continueShopping,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const CheckoutPage(),
                    //   ),
                    // );
                    // ProductDetailCart productDetailCart = getUser.cartBox;
                    orderProductDTOList = await cartViewModel.cartViewModel();

                    for (int i = 0; i < orderProductDTOList.length; i++) {
                      print(orderProductDTOList[i].name);
                    }
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(
                    AppLocalizations.of(context)!.checkout,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 248, 194, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
