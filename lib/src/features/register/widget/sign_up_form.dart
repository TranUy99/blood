import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';

import '../../../constant/color/color.dart';
import '../bloc_state/sign_up_bloc.dart';

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
            if (widget.validationType == 0 && !Validate.validName(value)) {
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

class BuildInputSignUpFormPassword extends StatefulWidget {
  BuildInputSignUpFormPassword({Key? key, required this.hint, required this.obscure, required this.textController, required this.function, required this.isConfirm,required this.validationType})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  late final bool obscure;
  final Widget function;
final int validationType;
  final bool isConfirm;
  @override
  State<BuildInputSignUpFormPassword> createState() => _BuildInputFormPasswordState();
}

class _BuildInputFormPasswordState extends State<BuildInputSignUpFormPassword> {
  bool error = false;
  String errorText = '';
  late TextEditingController confirmTextController;

  @override
  void initState() {
    super.initState();
    confirmTextController = TextEditingController();
  }

  @override
  void dispose() {
    confirmTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                if (Validate.checkInvalidateNewPassword(value)) {
                  error = true;
                  errorText = value.isEmpty ? 'Password không được để trống' : 'Invalid password';
                } else {
                  error = false;
                  widget.textController.text = value;
                }
              });
            },
            controller: widget.textController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: kTextFieldColor),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
              suffixIcon: widget.function,
              errorText: error ? errorText : null,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              setState(() {
                if (Validate.checkNotEqualNewPassword(widget.textController.text, value)) {
                  error = true;
                  errorText = value.isEmpty ? 'Password không được để trống' : 'Invalid confirm password';
                } else {
                  error = false;
                }
              });
            },
          controller: widget.textController,
          obscureText: widget.obscure,
          decoration: InputDecoration(
              errorText: error ? errorText : null,
              hintText: widget.hint,
              hintStyle: const TextStyle(color: kTextFieldColor),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
              suffixIcon: widget.function    ),
          ),
        ],
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
