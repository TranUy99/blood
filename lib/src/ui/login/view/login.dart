import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/navigation_home_page.dart';
import 'package:mobile_store/src/ui/change_password/view/change_password.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';
import 'package:mobile_store/src/constant/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login/widget/login_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/widget/login_option.dart';
import '../../../constant/widget/primary_button.dart';
import '../../register/view/sign_up.dart';
import '../bloc_state/log_in_bloc.dart';
import '../bloc_state/log_in_event.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  LogInBloc logInBloc = LogInBloc();
  bool obscure = true;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04),
                    child: Text(AppLocalizations.of(context)!.logIn.toUpperCase(), style: titleText)),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(children: [
                    BuildInputFormLogIn(
                      hint: 'Email',
                      textController: textEmailController,
                    ),
                    BuildInputFormPassword(
                      hint: 'Password',
                      obscure: obscure,
                      textController: textPasswordController,
                      function: obscureChange(),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CheckBox(text: 'Save account'),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordScreen()));
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: kZambeziColor,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                      // )
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: InkWell(
                    onTap: () {
                      // if (Validate.checkInvalidateNewPassword(textPasswordController.text) == false
                      //     && Validate.invalidateEmail(textEmailController.text) == false) {
                      //   //Input to bloc and set state
                      //   showTopSnackBar(Overlay.of(context),
                      //       const CustomSnackBar.success(message: 'Login successfully'));
                      //   //Login
                      //   setState(() {
                      //     indexScreen = 0;
                      //   });
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const NavigationHomePage(),
                      //       ));
                      // } else {
                      //   showTopSnackBar(
                      //       Overlay.of(context),
                      //       const CustomSnackBar.error(
                      //           message: 'Invalid information'));
                      // }
                      LogInEvent.loginEvent('yukatanguyen545@gmail.com', 'Candidate123');
                    },
                    child: const PrimaryButton(
                      buttonText: 'Log in'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    'Or Log in with:',
                    style: subtitle.copyWith(color: kBlackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: LoginOption(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
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
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
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
        ),
      ),
    );
  }

  Widget obscureChange() {
    return IconButton(
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
        icon: obscure
            ? const Icon(Icons.visibility_off, color: kGreenColor)
            : const Icon(Icons.visibility, color: kGreenColor));
  }
}
