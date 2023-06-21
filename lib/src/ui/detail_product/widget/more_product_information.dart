import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MoreProductInformation extends StatefulWidget {
  const MoreProductInformation({super.key});

  @override
  State<MoreProductInformation> createState() => _MoreProductInformationState();
}

class _MoreProductInformationState extends State<MoreProductInformation> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kGreenColor, width: 1.0),
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                AppLocalizations.of(context)!.configuration,
                style: const TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                children: [
                  const SizedBox(
                    height: 5,
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
                        const Expanded(
                          child:  Text(
                            "OLED6.7 Super Retina XDR",
                            style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                     const  Expanded(
                        child:  Text(
                          "Apple A16 Bionic",
                          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
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
                         const Expanded(
                           child: Text(
                            "6 GB",
                            style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                                                 ),
                         ),
                      ],
                    ),
                  ),
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
                        style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
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
                          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
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
                     const  Expanded(
                        child:  Text(
                          " 48 MP &  12 MP, 12 MP",
                          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.close,
                    style: const TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Text(
        AppLocalizations.of(context)!.seeMore,
        style: const TextStyle(
          color: kGreenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}