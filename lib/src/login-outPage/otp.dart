import 'package:flutter/material.dart';
import 'package:mobile_store/src/login-outPage/reset_password.dart';

import '../constant/colors/theme.dart';

import '../widget/otp_form.dart';
import '../widget/primary_button.dart';

class OtpScreen extends StatelessWidget {
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
                'Forgot Password',
                style: titleText,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify code has been sent to your phone number.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please confirm it.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              OtpForm(),
              SizedBox(
                height: 40,
              ),
              Text(
                'OTP code expires later 57 seconds.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen()));
                  },
                  child: PrimaryButton(buttonText: 'Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
