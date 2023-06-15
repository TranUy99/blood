import 'package:flutter/material.dart';
import 'package:mobile_store/theme.dart';

import '../widget/checkbox.dart';
import '../widget/login_option.dart';
import '../widget/primary_button.dart';
import '../widget/signup_form.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Image(
              image: AssetImage("images/un_login.png"),
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Register',
                style: titleText,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: kDefaultPadding,
              child: SignUpForm(),
            ),
           const  SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: CheckBox('Agree to term and conditions.'),
            ),
           const  SizedBox(
              height: 20,
            ),
            const Padding(
              padding: kDefaultPadding,
              child: PrimaryButton(buttonText: 'Sign up',),
            ),
           const  SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or sign in using:',
                style: subtitle.copyWith(color: kBlackColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: LoginOption(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
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
                              builder: (context) => const LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
