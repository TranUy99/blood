
import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import '../../../constant/color/color.dart';
class BuildInputFormSignIn extends StatefulWidget {
  const BuildInputFormSignIn({Key? key, required this.textController, required this.hint, required this.validationType}) : super(key: key);
  final TextEditingController textController;
  final String hint;
  final int validationType;

  @override
  State<BuildInputFormSignIn> createState() => _BuildInputFormSignInState();
}

class _BuildInputFormSignInState extends State<BuildInputFormSignIn> {
  bool error = false;
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (widget.validationType == 0 && Validate.validName(value)) {
              error = true;
              errorText = value.isEmpty
                  ? 'Tên không được để trống'
                  : value.startsWith(' ')
                      ? 'Không có dấu cách ở đầu'
                      : value.endsWith(' ')
                          ? 'Không có dấu cách cuối'
                          : 'Không được nhập số hoặc ký tự đặc biệt';
            } else if (widget.validationType == 1 && Validate.invalidateMobile(value)) {
              error = true;
              errorText = value.isEmpty
                  ? 'Tên không được để trống'
                  : value.contains(RegExp(r'[a-zA-Z!@#$%^&*()\-_=+[{\]}\\|;:,<.>/?\"]'))
                      ? 'Không được nhập chữ hoặc ký tự đặc biệt'
                      : 'Số điện thoại phải có đúng 10 chữ số';
            } else if (widget.validationType == 2 && Validate.invalidateEmail(value)) {
              error = true;
              errorText = value.isEmpty ? 'Email không được để trống' : 'Invalid email';
            } else {
              error = false;
            }
          });
        },
        controller: widget.textController,
        decoration: InputDecoration(
          errorText: error ? errorText : null,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
        ),
      ),
    );
  }
}

class CheckBoxSignIn extends StatefulWidget {
  final String text;
  final Widget isCheck;
  const CheckBoxSignIn({super.key, required this.text, required this.isCheck});

  @override
  _CheckBoxSignInState createState() => _CheckBoxSignInState();
}

class _CheckBoxSignInState extends State<CheckBoxSignIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isCheck,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(widget.text),
      ],
    );
  }
}
