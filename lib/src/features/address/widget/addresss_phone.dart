import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../../constant/utils/validate.dart';

class BuildAddressPhoneForm extends StatefulWidget {
  final TextEditingController textPhoneController;
  const BuildAddressPhoneForm({super.key, required this.textPhoneController});

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
          errorText: errorPhone ? errorPhoneText : null,
          hintText: "Nhan so dien thoai cua ban",
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty || Validate.invalidateMobile(value)) {
              errorPhone = true;
              errorPhoneText = value.isEmpty
                  ? 'Số điện thoại không được để trống'
                  : value.startsWith(' ')
                      ? 'Không có dấu cách ở đầu'
                      : value.endsWith(' ')
                          ? 'Không có dấu cách cuối'
                          : 'Số điện thoại phải 10 số';
            } else {
              errorPhone = false;
              errorPhoneText = '';
            }
          });
        },
      ),
    );
  }
}
