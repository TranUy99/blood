import 'package:flutter/material.dart';
import 'package:mobile_store/theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    body:
    Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text(
          'Reset Password',
          style: titleText,
        )
      ],
    );
  }
}
