import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.selectPay,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        RadioListTile<String>(
          title: Row(
            children: [
              Image.asset(
                'assets/icon/momo_icon.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 5),
              Text(AppLocalizations.of(context)!.momo),
            ],
          ),
          value: 'Momo',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              Image.asset(
                'assets/icon/receive_oder_icon.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 5),
              Text(AppLocalizations.of(context)!.payAfter),
            ],
          ),
          value: 'Cash',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              Image.asset(
                'assets/icon/banking_icon.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 5),
              Text(AppLocalizations.of(context)!.banking),
            ],
          ),
          value: 'Banking',
          groupValue: widget.paymentMethod,
          onChanged: widget.onChanged,
          activeColor: kGreenColor,
        ),
      ],
    );
  }
}
