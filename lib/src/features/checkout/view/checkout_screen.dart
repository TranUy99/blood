import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';

import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import '../../../core/model/address.dart';
import '../../../core/model/order_product_dto.dart';
import '../../../core/model/status_dto.dart';
import '../view_model/checkout_view_model.dart';
import '../widget/checkout_list_product.dart';
import '../widget/payment.dart';
import '../widget/delivery_address.dart';

class CheckoutPage extends StatefulWidget {
  int? idAddress;
  int? idPromotion;

  CheckoutPage({Key? key, required this.idAddress, required this.idPromotion}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final AddressViewModel _addressViewModel = AddressViewModel();
  CheckoutViewModel _checkoutViewModel = CheckoutViewModel();
  String? _paymentMethod;
  late Future<Address> _addressFuture;
  bool _uiBuilt = false;
  late Address address;

  @override
  void initState() {
    super.initState();
    _addressFuture = _addressViewModel.getIdAddress(widget.idAddress);
    _addressFuture.then((address) {
      setState(() {
        this.address = address;
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
                  const Text(
                    '0 USD',
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
                  const Text(
                    '2025 USD',
                    style: TextStyle(
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
                            final createOrder = await _checkoutViewModel.changePassword(
                                idUser: 3,
                                idPromotion: 1,
                                paymentMethodDTO: "Momo",
                                statusDTO: StatusDTO(id: 1, name: "Active"),
                                orderProductDTOList: [],
                                idAddress: 5,
                                receiveDate: "2023-08-08");
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
