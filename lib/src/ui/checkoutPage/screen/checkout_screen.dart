import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_app_bar.dart';

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
            leading: Image(
              image: const AssetImage('images/banner0.jpg'),
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            flexibleSpace: const CustomAppBar()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
                              'Delivery address',
                              style: TextStyle(
                                fontSize: 18.0,
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
                                    ' | 0583841958\n273 Ly Thuong Kiet, 6 ward, district 8, Ho Chi Minh cit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
              'Payment details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Name'),
                      Text('SKU: 123456789'),
                      Text('Quantity: 1'),
                    ],
                  ),
                ),
                Text('\$999.99'),
              ],
            ),
            SizedBox(height: 14.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Name'),
                      Text('SKU: 987654321'),
                      Text('Quantity: 1'),
                    ],
                  ),
                ),
                Text('\$699.99'),
              ],
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount'),
                Text('0 USD'),
              ],
            ),
            SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery fee'),
                Text('15 USD'),
              ],
            ),
            SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '1025 USD',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kRedColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select form to pay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                RadioListTile<String>(
                  title: Row(
                    children: [
                      Icon(Icons.account_balance_wallet),
                      SizedBox(width: 5),
                      Text('Wallet MoMo'),
                    ],
                  ),
                  value: 'wallet_momo',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value;
                    });
                  },
                  activeColor: kGreenColor,
                ),
                RadioListTile<String>(
                  title: Row(
                    children: [
                      Icon(Icons.payment),
                      SizedBox(width: 5),
                      Text('Pay after receive order'),
                    ],
                  ),
                  value: 'pay_after_receive_order',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value;
                    });
                  },
                  activeColor: kGreenColor,
                ),
                RadioListTile<String>(
                  title: Row(
                    children: [
                      Icon(Icons.account_balance),
                      SizedBox(width: 5),
                      Text('Banking'),
                    ],
                  ),
                  value: 'banking',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value;
                    });
                  },
                  activeColor: kGreenColor,
                ),
              ],
            ),
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
                          'Pay',
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
          ],
        ),
      ),
    );
  }
}
