import 'package:flutter/material.dart';
import 'package:mobile_store/ui/login/srceen/login.dart';
import 'package:mobile_store/ui/widget/primary_button.dart';
import 'package:mobile_store/theme.dart';

import 'package:mobile_store/ui/widget/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Image(
                image: AssetImage("images/un_login.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Reset Password',
                style: titleText,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your new password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ResetPasswordForm(),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  child: PrimaryButton(buttonText: 'Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
