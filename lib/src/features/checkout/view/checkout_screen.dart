import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/order_product_dto.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../main.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/promotion.dart';
import '../../../core/model/status_dto.dart';
import '../../address/view_model/address_view_model.dart';
import '../../cart_page/view_model/cart_view_model.dart';
import '../../component/custom_app_bar.dart';
import '../../home_page/view/navigation_home_page.dart';
import '../../promotion/view_model/promotion_view_model.dart';
import '../view_model/checkout_view_model.dart';
import '../widget/checkout_list_product.dart';
import '../widget/delivery_address.dart';
import '../widget/payment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final AddressViewModel _addressViewModel = AddressViewModel();
  final CheckoutViewModel _checkoutViewModel = CheckoutViewModel();
  final PromotionViewModel _promotionViewModel = PromotionViewModel();
  final CartViewModel _cartViewModel = CartViewModel();

  String? _paymentMethod;

  List<OrderProductDTO> cartList = [];
  late PromotionDTO promotion;

  late Address address;

  bool _uiBuilt = false;

  @override
  void initState() {
    super.initState();

    final selectedPromotionCubit = context.read<SelectedPromotionCubit>();
    final selectedPromotionId = selectedPromotionCubit.state;
    final selectedAddressCubit = context.read<SelectedAddressCubit>();
    final selectedAddressId = selectedAddressCubit.state;

    final promotionFuture = _promotionViewModel.getIdPromotion(selectedPromotionId);
    final addressFuture = _addressViewModel.getIdAddress(selectedAddressId);
    final cartFuture = _cartViewModel.cartViewModel();

    Future.wait([promotionFuture, addressFuture, cartFuture]).then((results) {
      final promotion = results[0] as PromotionDTO;
      final address = results[1] as Address;
      final cartList = results[2] as List<OrderProductDTO>;

      setState(() {
        this.promotion = promotion;
        this.address = address;
        this.cartList = cartList;
        _uiBuilt = true;
      });
    });
  }

  double? totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    if (_uiBuilt) {
      return buildUI(context);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget buildUI(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
        appBar: appBarWidget(context, true),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Check if address is not null
              DeliveryAddress(
                name: '${address.nameReceiver}',
                phone: '${address.phoneReceiver}',
                address: '${address.location}',
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.paymentDetails,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              CheckoutList(
                totalAmount: totalAmount!,
                totalAmountSelected: (double? index) {
                  setState(() {
                    totalAmount = index;
                  });
                },
              ),
              Text("Total Amount: ${NumberFormat('#,###.###').format(totalAmount)} VND"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.discount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                  if (promotion.discountDTO != null)
                    if ((totalAmount! * (promotion.discountDTO! * 0.01)) > promotion.maxGetDTO!)
                      Text(
                        "${NumberFormat('#,###.###').format(promotion.maxGetDTO!)} VND ",
                      )
                    else
                      Text(
                        '${promotion.discountDTO}%',
                      )
                  else
                    const Text(
                      '0%',
                    )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.deliveryfee,
                    style: const TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                  const Text(
                    'Free Ship',
                    style: TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (promotion.discountDTO != null)
                    if ((totalAmount! * (promotion.discountDTO! * 0.01)) > promotion.maxGetDTO!)
                      Text(
                        "${NumberFormat('#,###.###').format(totalAmount! - promotion.maxGetDTO!)} VND ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kRedColor,
                        ),
                      )
                    else
                      Text(
                        "${NumberFormat('#,###.###').format(totalAmount! - (totalAmount! * (promotion.discountDTO! * 0.01)))} VND ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kRedColor,
                        ),
                      )
                  else
                    Text(
                      "${NumberFormat('#,###.###').format(totalAmount!)} VND ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kRedColor,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),
              PaymentMethod(
                paymentMethod: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value;
                  });
                },
              ),
              const SizedBox(height: 32.0),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            final createOrder = await _checkoutViewModel.checkout(
                                idUser: getUser.idUser,
                                idPromotion: promotion.id ?? 0,
                                paymentMethodDTO: "$_paymentMethod",
                                statusDTO: StatusDTO(id: 1, name: "Active"),
                                orderProductDTOList: cartList,
                                idAddress: address.id,
                                receiveDate: formattedDate);

                            if (createOrder == true) {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message: 'Order success',
                                ),
                              );

                              // ignore: use_build_context_synchronously
                              await _cartViewModel.streamLengthCartList();
                              await _cartViewModel.streamPriceCartList();
                              setState(() {
                                indexScreen = 0;
                                context.read<SelectedPromotionCubit>().resetState();
                                context.read<SelectedAddressCubit>().resetState();
                                getUser.cartBox!.deleteAll(getUser.cartBox!.keys);
                              });
                              Get.offAll(const NavigationHomePage());
                            } else {
                              showTopSnackBar(
                                // ignore: use_build_context_synchronously
                                Overlay.of(context),
                                const CustomSnackBar.error(
                                  message: 'Order Failed',
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kGreenColor,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.pay,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
