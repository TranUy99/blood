import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_app_bar.dart';

import '../../cartPage/cart_page.dart';

import '../widget/payment.dart';

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
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            AppLocalizations.of(context)!.deliveryAdress,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      RichText(
                        text: TextSpan(
                          text: 'Tran Ky Anh',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  ' | 0583841958\n273 Ly Thuong Kiet, 6 ward, district 8, Ho Chi Minh city',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          Text(
            AppLocalizations.of(context)!.paymentDetails,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'images/iphone14Blue.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(width: 5),
              Expanded(
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
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Quantity: 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '1025 USD',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: kGreenColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Image.asset(
                'images/ZFlip4.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(width: 5),
              Expanded(
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
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Quantity: 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '1000 USD',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: kGreenColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          PaymentMethod(
            paymentMethod: _paymentMethod,
            onChanged: (value) {
              setState(() {
                _paymentMethod = value;
              });
            },
          ),
          SizedBox(height: 32.0),
          Container(
            margin: EdgeInsets.only(bottom: 16),
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
                        style: TextStyle(
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
