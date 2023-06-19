import 'package:flutter/material.dart';
import 'package:mobile_store/theme.dart';

Widget buildInputForm(
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