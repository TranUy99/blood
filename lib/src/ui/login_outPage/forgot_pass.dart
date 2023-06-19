import 'package:flutter/material.dart';

import 'package:mobile_store/src/ui/login_outPage/otp.dart';

import 'package:mobile_store/theme.dart';
import 'package:mobile_store/widget/forgot_pass_form.dart';


import '../../../widget/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                'Forgot Password',
                style: titleText,
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your phone number',
                style: subtitle.copyWith(fontWeight: FontWeight.w600),
              ),
             const SizedBox(height: 10),
              const ForgotPasswordForm(),
            const  SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const OtpScreen()));
                  },
                  child: const PrimaryButton(buttonText: 'Send OTP'))
            ],
          ),
        ),
      ),
    );
  }
}
