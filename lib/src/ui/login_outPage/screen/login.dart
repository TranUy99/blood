import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/navigation_home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/change_password.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/sign_up.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_option.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../bloc/log_in_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  LogInBloc logInBloc = LogInBloc();
  SharedTextPasswordBloc sharedTextBloc = SharedTextPasswordBloc();
  bool obscure = true;
  bool isCheck = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sharedTextBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04), child: Text(AppLocalizations.of(context)!.logIn.toUpperCase(), style: titleText)),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(children: [
                    BuildInputFormLogIn(
                      hint: AppLocalizations.of(context)!.phoneNumber,
                      textController: textPhoneController,
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CheckBox(text: 'Save account'),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: InkWell(
                    onTap: () {
                      if (Validate.checkInvalidateNewPassword(textPasswordController.text) == false && Validate.invalidateMobile(textPhoneController.text) == false) {
                        //Input to bloc and set state
                        logInBloc.updateInformation(textPhoneController.text, textPasswordController.text);
                        logInBloc.logIn();
                        showTopSnackBar(Overlay.of(context), const CustomSnackBar.success(message: 'Login successfully'));
                        //Login
                        setState(() {
                          indexScreen = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationHomePage(),
                            ));
                      } else {
                        showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'Invalid information'));
                      }
                    },
                    child: const PrimaryButton(buttonText: 'Log in'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    'Or Log in with:',
                    style: subtitle.copyWith(color: kBlackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: LoginOption(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
        icon: obscure ? const Icon(Icons.visibility_off, color: kGreenColor) : const Icon(Icons.visibility, color: kGreenColor));
  }
}

