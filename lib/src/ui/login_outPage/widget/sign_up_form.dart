import 'package:flutter/material.dart';

import '../../../constant/colors/theme.dart';

Widget buildInputFormSignIn(String hint, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kTextFieldColor),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor)),
      ),
    ),
  );
}

class buildInputFormPassword extends StatefulWidget {
  buildInputFormPassword(
      {Key? key,
      required this.hint,
      required this.obscure,
      required this.textController, required this.function})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  late final bool obscure;
  final Widget function;

  @override
  State<buildInputFormPassword> createState() => _buildInputFormPasswordState();
}

class _buildInputFormPasswordState extends State<buildInputFormPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: widget.textController,
        obscureText: widget.obscure,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: kTextFieldColor),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            suffixIcon: widget.function),
      ),
    );
  }
}
