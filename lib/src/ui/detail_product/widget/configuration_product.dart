import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/detail_product/widget/more_configuration.dart';
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
            Container(
              color: kWhiteGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      AppLocalizations.of(context)!.screen,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "OLED6.7 Super Retina XDR",
                    style: TextStyle(
                        color: kBlackColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //chip product
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    AppLocalizations.of(context)!.chip,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "Apple A16 Bionic",
                  style: TextStyle(
                      color: kBlackColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              color: kWhiteGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      AppLocalizations.of(context)!.ram,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "6 GB",
                    style: TextStyle(
                        color: kBlackColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //capacity product
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    AppLocalizations.of(context)!.capacity,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "128 Gb",
                  style: TextStyle(
                      color: kBlackColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //ram product
            Container(
              color: kWhiteGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      AppLocalizations.of(context)!.battery,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "4323 mAh",
                    style: TextStyle(
                        color: kBlackColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //camera
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    AppLocalizations.of(context)!.camera,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  " 48 MP &  12 MP, 12 MP",
                  style: TextStyle(
                      color: kBlackColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //
            Container(
              color: kWhiteGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      AppLocalizations.of(context)!.connect,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "1 Nano SIM & 1 eSIM, 5G Support",
                    style: TextStyle(
                        color: kBlackColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
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
