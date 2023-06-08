import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/signup.dart';
import 'package:mobile_store/theme.dart';

import '../widget/login_form.dart';
import '../widget/login_option.dart';
import '../widget/primary_button.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 120,
            ),
            Text(
              'LOGIN',
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Don\'t have an account?',
                  style: subtitle,
                ),
                SizedBox(
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
            SizedBox(
              width: 10,
            ),
            LogInForm(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forgot password?',
              style: TextStyle(
                  color: kZambeziColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              buttonText: 'Log in',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Or log in with:',
              style: subtitle.copyWith(color: kBlackColor),
            ),
            SizedBox(
              height: 20,
            ),
            LoginOption(),
          ]),
        ),
      ),
    );
  }
}
