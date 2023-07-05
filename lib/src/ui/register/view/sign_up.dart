import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';
import 'package:mobile_store/src/constant/widget/login_option.dart';
import 'package:mobile_store/src/constant/widget/primary_button.dart';
import 'package:mobile_store/src/ui/register/widget/sign_up_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc_state/sign_up_bloc.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();
  SignUpBloc signUpBloc = SignUpBloc();
  SignUpTexPasswordBloc sharedTextBloc = SignUpTexPasswordBloc();
  bool obscure = true;
  bool isCheck = false;

  List<String> registerList() {
    List<TextEditingController> textEditingControllerList = [
      textNameController,
      textPhoneController,
      textEmailController,
      textPasswordController,
      textConfirmPasswordController,
    ];
    List<String> listOfRegister = [];
    for (TextEditingController controllers in textEditingControllerList) {
      listOfRegister.add(controllers.text);
    }
    return listOfRegister;
  }

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
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Text(
                    AppLocalizations.of(context)!.signUp.toUpperCase(),
                    style: titleText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(children: [
                    BuildInputFormSignIn(
                      hint: AppLocalizations.of(context)!.fullName,
                      textController: textNameController,
                      validationType: 0,
                    ),
                    BuildInputFormSignIn(
                        hint: AppLocalizations.of(context)!.phoneNumber,
                        textController: textPhoneController,
                        validationType: 1),
                    BuildInputFormSignIn(
                      hint: 'Email',
                      textController: textEmailController,
                      validationType: 2,
                    ),
                    BuildInputFormPassword(
                      hint: AppLocalizations.of(context)!.password,
                      obscure: obscure,
                      textController: textPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      isConfirm: false,
                    ),
                    BuildInputFormPassword(
                      hint: AppLocalizations.of(context)!.confirmPassword,
                      obscure: obscure,
                      textController: textConfirmPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      isConfirm: true,
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: CheckBoxSignIn(
                      text: AppLocalizations.of(context)!
                          .agreeToTermAndConditions,
                      isCheck: isCheckCheckbox()),
                ),
                GestureDetector(
                  onTap: () {
                    if (isCheck) {
                      if (Validate.validFullName(registerList()[0]) == false &&
                          Validate.invalidateMobile(registerList()[1]) ==
                              false &&
                          Validate.invalidateEmail(registerList()[2]) ==
                              false &&
                          Validate.checkInvalidateNewPassword(
                                  registerList()[3]) ==
                              false &&
                          Validate.checkNotEqualNewPassword(
                                  registerList()[3], registerList()[4]) ==
                              false) {
                        signUpBloc.updateInformation(registerList());
                        signUpBloc.signUp();
                        Navigator.pop(context);
                        showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.success(
                                message: AppLocalizations.of(context)!
                                    .signUpsuccessfully));
                      } else {
                        showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                                message: AppLocalizations.of(context)!
                                    .invalidInformation));
                      }
                    } else {
                      showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                              message: AppLocalizations.of(context)!
                                  .agreeToTermAndConditions));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: PrimaryButton(
                      buttonText: AppLocalizations.of(context)!.signUp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, 
                    mainAxisAlignment: MainAxisAlignment
                        .center, 
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
                            AppLocalizations.of(context)!.signUpwith,
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
                        crossAxisAlignment: CrossAxisAlignment
                            .center, 
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.alreadyHaveAnAccount}?',
                            style: subtitle,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.012,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.logIn,
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
            ? const Icon(
                Icons.visibility_off,
                color: kGreenColor,
              )
            : const Icon(
                Icons.visibility,
                color: kGreenColor,
              ));
  }

  Widget isCheckCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
      child: Container(
        width: MediaQuery.of(context).devicePixelRatio * 7,
        height: MediaQuery.of(context).devicePixelRatio * 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: kDarkGreyColor)),
        child: isCheck
            ? const Icon(Icons.check, size: 17, color: Colors.green)
            : null,
      ),
    );
  }
}
