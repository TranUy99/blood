import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/color/color.dart';

class DeliveryAddress extends StatelessWidget {
  final String name;
  final String phone;
  final String address;

  const DeliveryAddress({
    Key? key,
    required this.name,
    required this.phone,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(width: 8.0),
              Text(
                AppLocalizations.of(context)!.deliveryAddress,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          RichText(
            text: TextSpan(
              text: name,
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 16.0,
              ),
              children: [
                TextSpan(
                  text: ' | $phone\n$address',
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
