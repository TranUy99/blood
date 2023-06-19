import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/reset_password.dart';

import 'package:mobile_store/theme.dart';
import 'package:mobile_store/widget/primary_button.dart';

import '../../../widget/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const  SizedBox(
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
              const Column(
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
             const OtpForm(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'OTP code expires later 57 seconds.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen()));
                  },
                  child:const PrimaryButton(buttonText: 'Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
