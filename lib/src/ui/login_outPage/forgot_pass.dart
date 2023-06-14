import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/widget/primary_button.dart';
import 'package:mobile_store/theme.dart';

import '../widget/forgot_pass_form.dart';
import 'package:mobile_store/src/ui/login_outPage/otp.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
              Text(
                'Please enter your phone number',
                style: subtitle.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              ForgotPasswordForm(),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpScreen()));
                  },
                  child: PrimaryButton(buttonText: 'Send OTP'))
            ],
          ),
        ),
      ),
    );
  }
}
