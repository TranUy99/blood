import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/promotion.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import '../../../core/model/address.dart';
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

Address? address; // Change Address to be nullable
final AddressViewModel _addressViewModel = AddressViewModel();

class _CheckoutPageState extends State<CheckoutPage> {
  String? _paymentMethod;
  late Future<Address> _addressFuture;
  late Future<PromotionDTO> _promotionFuture;
  late Address address;

  @override
  void initState() {
    super.initState();
    _loadData(); // Load address when the state is initialized
  }

  Future<void> _loadData() async {
    _addressFuture = _addressViewModel.getIdAddress(widget.idAddress);
    //  _promotionFuture = _addressViewModel.getIdAddress(widget.idAddress);
  }

  double? totalAmount = 0;

  void updateTotalAmount(double? newTotalAmount) {
    setState(() {
      totalAmount = newTotalAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        _addressFuture,
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data as List<dynamic>;
            address = data[0] as Address;
            // final List<Product> products = data[1] as List<Product>;
            // final List<Promotion> promotions = data[2] as List<Promotion>;

            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return const Text('No data ');
          }
        }
      },
    );
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
              CheckoutList(updateTotalAmountCallback: updateTotalAmount),
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
                          onPressed: () {},
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
