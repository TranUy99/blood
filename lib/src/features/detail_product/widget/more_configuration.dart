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
