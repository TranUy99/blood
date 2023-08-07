import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import '../../../../main.dart';
import '../../checkout/screen/checkout_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('idUser: ${getUser.idUser}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // số lượng sản phẩm trong giỏ hàng
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        // Container(
                        //   width: 120.0,
                        //   decoration: const BoxDecoration(
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(15.0),
                        //       bottomLeft: Radius.circular(15.0),
                        //     ),
                        //   ),
                        //   child: Image.asset(
                        //     'assets/icon/iphone.png',
                        //     height: 150,
                        //     width: 80,
                        //   ),
                        // ),
                        // const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
//'Product ${index + 1}',
                              'Iphone 14 Pro Max',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
//'${widget.productDTO.price}',
                              '1099 USD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kGreenColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                IconTheme(
                                  data: IconThemeData(color: quantity == 1 ? kGreyColor : null),
                                  child: IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
// xử lý giảm số lượng sản phẩm
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
// xử lý tăng số lượng sản phẩm
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                      AppLocalizations.of(context)!.temporaryprice,
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
                    ),
                  ],
                ),
              ),
            ),
// selected address
            SelectedAddressCart(
              selectedAddressIndex: selectedAddressIndex,
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
                    ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutPage(),
                      ),
                    );
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
