import 'package:flutter/material.dart';
import 'package:mobile_store/login/srceen/signup.dart';
import 'package:mobile_store/login/srceen/forgot_pass.dart';
import 'package:mobile_store/theme.dart';

import 'package:mobile_store/src/ui/widget//checkbox.dart';
import 'package:mobile_store/src/ui/widget/login_form.dart';
import 'package:mobile_store/src/ui/widget/login_option.dart';
import 'package:mobile_store/src/ui/widget/primary_button.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 120,
            ),
            const Image(
              image: AssetImage("images/un_login.png"),
            ),
            Text(
              'LOGIN',
              style: titleText,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            LogInForm(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckBox('Save account'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              buttonText: 'Log in',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Or sign in using:',
              style: subtitle.copyWith(color: kBlackColor),
            ),
            const SizedBox(
              height: 20,
            ),
            LoginOption(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: subtitle,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Register',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
