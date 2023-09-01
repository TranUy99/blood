import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

  class BuildAddressForm extends StatefulWidget {
  final TextEditingController textAddressController;
  final Function(bool) errorAddress;

  BuildAddressForm({required this.textAddressController, required this.errorAddress});

  @override
  State<BuildAddressForm> createState() => _BuildAddressFormState();
}

class _BuildAddressFormState extends State<BuildAddressForm> {
  String errorAddressText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: widget.textAddressController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorText: widget.errorAddress(true) ? errorAddressText : null,
          hintText: '${AppLocalizations.of(context)?.enterYourAddress}',
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              widget.errorAddress(true);
              errorAddressText = '${AppLocalizations.of(context)?.addressCannotBeLeftBlank}';
            } else if (value.startsWith(' ')) {
              widget.errorAddress(true);
              errorAddressText = '${AppLocalizations.of(context)?.noSpacesAtTheBeginning}';
            } else if (value.endsWith(' ')) {
              widget.errorAddress(true);
              errorAddressText = '${AppLocalizations.of(context)?.noSpacesAtTheEndOfSentences}';
            } else {
              widget.errorAddress(false);
              errorAddressText = '';
            }
          });
        },
      ),
    );
  }
}
