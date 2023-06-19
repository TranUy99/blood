import 'package:flutter/material.dart';

import '../../../../constant/colors/theme.dart';

Widget buildInputFormSignIn(
    String hint,TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kTextFieldColor),
        focusedBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
      ),
    ),
  );
}

class buildInputFormPassword extends StatefulWidget {
  buildInputFormPassword({Key? key, required this.hint, required this.obscure, required this.textController}) : super(key: key);
  final TextEditingController textController;
  final String hint;
  late final bool obscure;
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
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscure = !widget.obscure;
                  });
                },
                icon: widget.obscure
                    ? const Icon(
                  Icons.visibility_off,
                  color: kPrimaryColor,
                )
                    : const Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ))),
      ),
    );
  }
}

