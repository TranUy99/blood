import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../constant/utils/validate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildAddressPhoneForm extends StatefulWidget {
  final TextEditingController textPhoneController;
  final Function(bool) onPhoneChanged;
  const BuildAddressPhoneForm(
      {super.key, required this.textPhoneController, required this.onPhoneChanged});

  @override
  State<BuildAddressPhoneForm> createState() => _BuildAddressPhoneFormState();
}

class _BuildAddressPhoneFormState extends State<BuildAddressPhoneForm> {
  bool errorPhone = false;
  String errorPhoneText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: widget.textPhoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorText: errorPhoneText.isNotEmpty ? errorPhoneText : null,
          hintText: '${AppLocalizations.of(context)?.enterYourPhoneNumber}',
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty || Validate.invalidateMobile(value)) {
              widget.onPhoneChanged(true);
              errorPhoneText = value.isEmpty
                  ? '${AppLocalizations.of(context)?.phoneNumberCanNotBeLeftBlank}'
                  : value.startsWith(' ')
                      ? '${AppLocalizations.of(context)?.noSpacesAtTheBeginning}'
                      : value.endsWith(' ')
                          ? '${AppLocalizations.of(context)?.noSpacesAtTheEndOfSentences}'
                          : '${AppLocalizations.of(context)?.phoneNumberMustBe10Digits}';
            } else {
              widget.onPhoneChanged(false);
              errorPhoneText = '';
            }
          });
        },
      ),
    );
  }
}
