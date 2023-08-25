import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';

import '../../../constant/utils/validate.dart';

class BuildNameAddressForm extends StatefulWidget {
  final TextEditingController textNameController;

  const BuildNameAddressForm({
    super.key,
    required this.textNameController,
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
          errorText: errorName ? errorNameText : null,
          hintText: "Nhan tên người nhận",
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty || Validate.validName(value)) {
              errorName = true;
              errorNameText = value.isEmpty
                  ? 'Tên không được để trống'
                  : value.startsWith(' ')
                      ? 'Không có dấu cách ở đầu'
                      : value.endsWith(' ')
                          ? 'Không có dấu cách cuối'
                          : 'Không được nhập số hoặc ký tự đặc biệt';
            } else {
              errorName = false;
              errorNameText = '';
            }
          });
        },
      ),
    );
  }
}
