import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/login.dart';
import 'package:mobile_store/src/ui/widget/primary_button.dart';
import 'package:mobile_store/theme.dart';

import '../widget/otp_form.dart';
import '../widget/reset_form.dart';

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
              SizedBox(
                height: 200,
              ),
              const Image(
                image: AssetImage("images/un_login.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Reset Password',
                style: titleText,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your new password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              ResetPasswordForm(),
              SizedBox(
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
