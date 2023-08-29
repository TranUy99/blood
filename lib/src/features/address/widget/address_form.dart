import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildAddressForm extends StatefulWidget {
  final TextEditingController textAddressController;
  const BuildAddressForm({super.key, required this.textAddressController});

  @override
  State<BuildAddressForm> createState() => _BuildAddressFormState();
}

class _BuildAddressFormState extends State<BuildAddressForm> {
  bool errorAddress = false;
  String errorAddressText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: widget.textAddressController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorText: errorAddress ? errorAddressText : null,
          hintText: '${AppLocalizations.of(context)?.enterYourAddress}',
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              errorAddress = true;
              errorAddressText = '${AppLocalizations.of(context)?.addressCannotBeLeftBlank}';
            } else if (value.startsWith(' ')) {
              errorAddress = true;
              errorAddressText = '${AppLocalizations.of(context)?.noSpacesAtTheBeginning}';
            } else if (value.endsWith(' ')) {
              errorAddress = true;
              errorAddressText = '${AppLocalizations.of(context)?.noSpacesAtTheEndOfSentences}';
            } 
          });
        },
      ),
    );
  }
}
