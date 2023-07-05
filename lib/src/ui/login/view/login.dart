import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';
import 'package:mobile_store/src/ui/change_password/view/change_password.dart';
import 'package:mobile_store/src/constant/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login/bloc_state/log_in_state.dart';
import 'package:mobile_store/src/ui/login/widget/login_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../constant/widget/login_option.dart';
import '../../../constant/widget/primary_button.dart';
import '../../homePage/screen/navigation_home_page.dart';
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
                    child: Text(
                        AppLocalizations.of(context)!.logIn.toUpperCase(),
                        style: titleText)),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(children: [
                    BuildInputFormLogIn(
                      hint: 'Email',
                      textController: textEmailController,
                    ),
                    BuildInputFormPassword(
                      hint: AppLocalizations.of(context)!.password,
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
                      CheckBox(text: AppLocalizations.of(context)!.rememberMe),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordScreen()));
                        },
                        child: Text(
                          '${AppLocalizations.of(context)!.forgotPassword}?',
                          style: TextStyle(
                            color: kBlackColor,
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
                      if (Validate.checkInvalidateNewPassword(textPasswordController.text) == false
                          && Validate.invalidateEmail(textEmailController.text) == false) {
                        //Input to bloc and set state
                        showTopSnackBar(Overlay.of(context),
                            const CustomSnackBar.success(message: 'Login successfully'));
                        //Login
                        LogInEvent.loginEvent(textEmailController.text, textPasswordController.text);
                        onLogInState = OnLogInState(true);
                        setState(() {
                          indexScreen = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationHomePage(),
                            ));
                      } else {
                        showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(
                                message: 'Invalid information'));
                      }
                    },
                    child: PrimaryButton(
                        buttonText: AppLocalizations.of(context)!.logIn),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: kGreyColor,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!.or,
                              style: subtitle.copyWith(
                                color: kGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: kGreyColor,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.logInwith,
                            style: subtitle.copyWith(color: kGreyColor),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: LoginOption(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dontAccount,
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
                                      builder: (context) =>
                                          const SignUpScreen()));
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
