import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_app_bar.dart';

import '../../cartPage/screen/cart_page.dart';

import '../widget/payment.dart';
import '../widget/delivery_address.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
            backgroundColor: kSecondaryColor,
            flexibleSpace: const CustomAppBar()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const DeliveryAddress(
            name: 'Tran Ky Anh',
            phone: '0583841958',
            address: '273 Ly Thuong Kiet, 6 ward, district 8, Ho Chi Minh city',
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
          Row(
            children: [
              Image.asset(
                'images/iphone14Blue.jpg',
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 5),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Iphone 14',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Blue, 128 GB',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      'Quantity: 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '1025 USD',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: kGreenColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Image.asset(
                'images/ZFlip4.jpg',
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 5),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Samsung Galaxy Z Flip 4',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Purple, 128GB',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      'Quantity: 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '1000 USD',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: kGreenColor,
                ),
              ),
            ],
          ),
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
        ]),
      ),
    );
  }
}
