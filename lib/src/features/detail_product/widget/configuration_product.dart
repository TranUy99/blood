import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/detail_product/widget/more_configuration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigurationProduct extends StatefulWidget {
  const ConfigurationProduct({super.key});

  @override
  State<ConfigurationProduct> createState() => _ConfigurationProductState();
}

class _ConfigurationProductState extends State<ConfigurationProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: kGreyColor,
          width: 0.8,
        ))),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            //configuration product
            Text(
              AppLocalizations.of(context)!.configuration.toUpperCase(),
              style: const TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            
            const SizedBox(height: 10),
            // more configuration product
            const MoreConfiguration(),

            // more  product information
          ],
        ),
      ),
    );
  }
}
