import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_state.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/cart_page/widget/cart_list_view.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/model/order_product_dto.dart';
import '../../checkout/view/checkout_screen.dart';
import '../bloc/cart_bloc.dart';
import '../widget/cart_selecte_address.dart';
import '../widget/cart_selecte_promotion.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  static CartBloc cartBloc = CartBloc.getPrice();
  static CartViewModel cartViewModel1 = CartViewModel();

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? selectedAddressIndex = 0;
  int? selectedPromotionIndex = 0;
  List<OrderProductDTO> orderProductDTOList = [];
  CartViewModel cartViewModel = CartViewModel();
  final textCurrency = NumberFormat("#,###.###", "en_US");
  double price = 0;



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: appBarWidget(context, false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CartListView(),
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
                    FutureBuilder(
                      future: cartViewModel.totalPay(),
                      builder: (context, getData) {
                        if (getData.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (getData.hasError) {
                          return Text('Error: ${getData.error}');
                        } else {
                          return StreamBuilder<GetPriceCartState>(
                            initialData: GetPriceCartState(getData.data!),
                            stream: CartPage.cartBloc.getPriceStateController.stream,
                            builder: (context, snapshot) {
                              return Text(
                                '${textCurrency.format(snapshot.data?.price)} đ',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: kGreenColor,
                                ),
                              );
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
// selected address
            const SelectedAddressCart(),

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
              child: SelectedPromotionCard(),
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
                    setState(() {
                      indexScreen = 0;
                      Get.offAll(const NavigationHomePage());
                    });
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
                    final selectedAddressCubit = context.read<SelectedAddressCubit>();
                    final selectedAddressId = selectedAddressCubit.state;

                    orderProductDTOList = await cartViewModel.cartViewModel();

                    if (selectedAddressId == 0 ||
                        // selectedPromotionIndex == null ||
                        orderProductDTOList.isEmpty) {
                      showTopSnackBar(
                        // ignore: use_build_context_synchronously
                        Overlay.of(context),
                         CustomSnackBar.error(
                          message:'${AppLocalizations.of(context)?.pleaseEnterFullInformation} ',
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutPage(),
                        ),
                      );
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
