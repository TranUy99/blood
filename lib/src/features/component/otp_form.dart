import 'package:flutter/material.dart';

import '../../constant/color/color.dart';


class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: 'OTP',
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGreenColor))),
      ),
    );
  }
}
