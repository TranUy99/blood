import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';

import '../../../constant/color/color.dart';

class BuildInputFormLogIn extends StatefulWidget {
  const BuildInputFormLogIn(
      {Key? key, required this.textController, required this.hint})
      : super(key: key);
  final TextEditingController textController;
  final String hint;

  @override
  State<BuildInputFormLogIn> createState() => _BuildInputFormLogInState();
}

class _BuildInputFormLogInState extends State<BuildInputFormLogIn> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (Validate.invalidateEmail(value)) {
              error = true;
              errorText = widget.textController.text.isEmpty
                  ? 'Please enter email'
                  : 'Incorrect email';
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
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor)),
        ),
      ),
    );
  }
}

class BuildInputFormPassword extends StatefulWidget {
  BuildInputFormPassword({
    Key? key,
    required this.hint,
    required this.obscure,
    required this.textController,
    required this.function,
  }) : super(key: key);
  final TextEditingController textController;
  final String hint;
  late final bool obscure;
  final Widget function;

  @override
  State<BuildInputFormPassword> createState() => _BuildInputFormPasswordState();
}

class _BuildInputFormPasswordState extends State<BuildInputFormPassword> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (Validate.checkInvalidateNewPassword(value)) {
              error = true;
              errorText = widget.textController.text.isEmpty
                  ? 'Please enter password'
                  : 'Incorrect password';
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
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kGreenColor)),
            suffixIcon: widget.function),
      ),
    );
  }
}

class CheckBoxLogIn extends StatefulWidget {
  final String text;
  final Widget isRemember;

  const CheckBoxLogIn(
      {super.key, required this.text, required this.isRemember});

  @override
  _CheckBoxLogInState createState() => _CheckBoxLogInState();
}

class _CheckBoxLogInState extends State<CheckBoxLogIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isRemember,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(widget.text),
      ],
    );
  }
}
