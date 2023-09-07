import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';

import '../../../constant/utils/validate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildNameAddressForm extends StatefulWidget {
  final TextEditingController textNameController;
   final Function(bool) onNameChanged;
  const BuildNameAddressForm({
    super.key,
    required this.textNameController,
    required this.onNameChanged,
  });

  @override
  State<BuildNameAddressForm> createState() => _BuildNameFormAddressState();
}

class _BuildNameFormAddressState extends State<BuildNameAddressForm> {
  bool errorName = false;
  String errorNameText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: widget.textNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorText: errorNameText.isNotEmpty ? errorNameText : null,
          hintText: '${AppLocalizations.of(context)?.enterTheRecipientName}',
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty || Validate.validName(value)) {
             widget.onNameChanged(true);
              errorNameText = value.isEmpty
                  ? '${AppLocalizations.of(context)?.nameCannotBeBlank}'
                  : value.startsWith(' ')
                      ? '${AppLocalizations.of(context)?.noSpacesAtTheBeginning}'
                      : value.endsWith(' ')
                          ? '${AppLocalizations.of(context)?.noSpacesAtTheEndOfSentences}'
                          : '${AppLocalizations.of(context)?.doNotEnterNumbersOrSpecialCharacters}';
            } else {
               widget.onNameChanged(false);
              errorNameText = '';
            }
          });
        },
      ),
    );
  }
}
