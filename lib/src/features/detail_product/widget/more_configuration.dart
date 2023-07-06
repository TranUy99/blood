import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';

class MoreConfiguration extends StatefulWidget {
  const MoreConfiguration({super.key});

  @override
  State<MoreConfiguration> createState() => _MoreConfigurationState();
}

class _MoreConfigurationState extends State<MoreConfiguration> {
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
                AppLocalizations.of(context)!.configuration.toUpperCase(),
                style: const TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    //screen
                    Container(
                      color: kWhiteGrey, //background
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
                            child: Text(
                              "OLED6.7 Super Retina XDR",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        const Expanded(
                          child: Text(
                            "Apple A16 Bionic",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //ram
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
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
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
                    //battery
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
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
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
                        const Expanded(
                          child: Text(
                            " 48 MP &  12 MP, 12 MP",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //connect
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
                          const Expanded(
                            child: Text(
                              "1 Nano SIM & 1 eSIM, 5G Support",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //utilities
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            AppLocalizations.of(context)!.utilities,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Face ID Face Unlock, Unlock with passcode",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //generalinformation
                    Container(
                      color: kWhiteGrey,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              AppLocalizations.of(context)!.generalinformation,
                              style: const TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "Length 160.7 mm - Width 77.6 mm - Thickness 7.85 mm - Weight 240 g",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //sensor
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            AppLocalizations.of(context)!.sensor,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Proximity sensor",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //release
                    Container(
                      color: kWhiteGrey, //background
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              AppLocalizations.of(context)!.releasetime,
                              style: const TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "09/2022",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //operating system (os)
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            AppLocalizations.of(context)!.os,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "IOS (version 16)",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //brand
                    Container(
                      color: kWhiteGrey, //background
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              AppLocalizations.of(context)!.brand,
                              style: const TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "Apple",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //warranty period
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            AppLocalizations.of(context)!.warrantyperiod,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "12 months",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //instructions for use
                    Container(
                      color: kWhiteGrey, //background
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              AppLocalizations.of(context)!.instructions,
                              style: const TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "See in the user manual",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //accessories
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            AppLocalizations.of(context)!.accessories,
                            style: const TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Cable, SIM card, User Manual",
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //close
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
