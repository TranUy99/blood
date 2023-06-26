import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/sign_up_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/event/sign_up_event.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_option.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/sign_up_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../state/sign_up_state.dart';


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
  bool obscure = true;
  SignUpBloc signUpBloc = SignUpBloc();
  SharedTextPasswordBloc sharedTextBloc = SharedTextPasswordBloc();


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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Text(
                    'REGISTER',
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
                      hint: 'Password',
                      obscure: obscure,
                      textController: textPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      isConfirm: false,
                    ),
                    BuildInputFormPassword(
                      hint: 'Confirm Password',
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
                  child: CheckBox(text: 'Agree to term and conditions.'),
                ),
                GestureDetector(
                  onTap: () {
                    if(Validate.validFullName(registerList()[0]) == false &&
                        Validate.invalidateMobile(registerList()[1]) == false &&
                        Validate.invalidateEmail(registerList()[2]) == false &&
                        Validate.checkInvalidateNewPassword(registerList()[3]) == false &&
                        Validate.checkNotEqualNewPassword(registerList()[3], registerList()[4]) == false){
                      signUpBloc.updateInformation(registerList());
                      signUpBloc.signUp();
                      Navigator.pop(context);
                      showTopSnackBar(Overlay.of(context), const CustomSnackBar.success(message: 'Sign up successful, Please login'));
                    }else{
                      showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'Invalid information'));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: const PrimaryButton(
                      buttonText: 'Sign up',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    '${AppLocalizations.of(context)!.orSignInUsing}:',
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
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
}
