import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/sign_up.dart';

import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/forgot_pass_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_option.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../state/log_in_state.dart';
import '../bloc/log_in_bloc.dart';
import '../event/log_in_event.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  bool obscure = true;
  LogInBloc logInBloc = LogInBloc();
  SharedTextPasswordBloc sharedTextBloc = SharedTextPasswordBloc();

  var Get;

  List<String> loginList() {
    List<TextEditingController> textEditingControllerList = [
      textPhoneController,
      textPasswordController,
    ];
    List<String> listOfLogin = [];
    for (TextEditingController controllers in textEditingControllerList) {
      listOfLogin.add(controllers.text);
    }
    return listOfLogin;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sharedTextBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var get = Get;
    var scaffold = Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'LOGIN',
                style: titleText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(children: [
                BuildInputFormLogIn(
                  hint: AppLocalizations.of(context)!.phoneNumber,
                  textController: textPhoneController,
                  validationType: 1,
                ),
                BuildInputFormPassword(
                  hint: 'Password',
                  obscure: obscure,
                  textController: textPasswordController,
                  function: obscureChange(),
                  sharedTextPasswordBloc: sharedTextBloc,
                ),
                // StreamBuilder<LogInState>(
                //   stream: bloc.stateController.stream,
                //   initialData: bloc.state,
                //   builder: (context, snapshot) {
                //     return Text(snapshot.data!.onUpdated.join(', '));
                //   },
                //   )
              ]),
            ),

            const Padding(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckBox('Save account'),
                  // GestureDetector(
                  //   onTap(){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassWordScreen()));
                  //   },

                  Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: kZambeziColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // GestureDetector(
            //   onTap: () => Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HomePage(),
            //       )),
            // GestureDetector(
            //   onTap: () {
            //     return bloc.eventLogInController.sink
            //         .add(LogInEvent(loginList()));
            //   },
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => HomePage()));
            //   },

            GestureDetector(
              onTap: () {
                if (Validate.checkInvalidateNewPassword(
                            textPasswordController.text) ==
                        false &&
                    Validate.invalidateMobile(textPhoneController.text) ==
                        false) {
                  logInBloc.updateInformation(
                      textPhoneController.text, textPasswordController.text);
                  logInBloc.logIn();
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.success(message: 'Right'));
                } else {
                  showTopSnackBar(Overlay.of(context),
                      CustomSnackBar.error(message: 'Invalid information'));
                }
              },
              child: Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(
                  buttonText: 'Log in',
                  onPressed: () {
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or Log in with:',
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
                      'Register',
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
    return scaffold;
  }

  Widget obscureChange() {
    return IconButton(
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
        icon: obscure
            ? const Icon(
                Icons.visibility_off,
                color: kGreenColor,
              )
            : const Icon(
                Icons.visibility,
                color: kGreenColor,
              ));
  }

// goToHomePage(BuildContext context) {
//   print('object');
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomePage(),
//       ));
// }
}

//ResetPassWordScreen() {}
