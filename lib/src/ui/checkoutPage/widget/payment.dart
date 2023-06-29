import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';

class PaymentMethod extends StatefulWidget {
  final String? paymentMethod;
  final Function(String?) onChanged;

  const PaymentMethod({
    Key? key,
    required this.paymentMethod,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              Image.asset(
                'images/momo_icon.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 5),
              Text('Wallet MoMo'),
            ],
          ),
          value: 'wallet_momo',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              Image.asset(
                'images/receive_oder_icon.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 5),
              Text('Pay after receive order'),
            ],
          ),
          value: 'pay_after_receive_order',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              Image.asset(
                'images/banking_icon.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 5),
              Text('Banking'),
            ],
          ),
          value: 'banking',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
      ],
    );
  }
}
