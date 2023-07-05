import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';

import '../../../constant/colors/theme.dart';

class BuildInputFormLogIn extends StatefulWidget {
  const BuildInputFormLogIn(
      {Key? key,
      required this.textController,
      required this.hint})
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
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (Validate.invalidateEmail(value)) {
              error = true;
              errorText = 'Invalid email';
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
  BuildInputFormPassword(
      {Key? key,
      required this.hint,
      required this.obscure,
      required this.textController,
      required this.function,})
      : super(key: key);
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
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (Validate.checkInvalidateNewPassword(value)) {
              error = true;
              errorText = 'Invalid password';
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
