import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/component/primary_button.dart';
import 'package:mobile_store/src/features/login/view/login_option.dart';
import 'package:mobile_store/src/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:mobile_store/src/features/sign_up/widget/sign_up_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../constant/utils/validate.dart';
import '../../login/view/login.dart';
import '../view_model/sign_up_view_model.dart';

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
  SignUpViewModel _signUpViewModel = SignUpViewModel();
  SignUpBloc _signUpBloc = SignUpBloc();
  bool obscure = true;
  bool isCheck = false;
  bool error = false;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    _signUpBloc = SignUpBloc();
    _signUpViewModel = SignUpViewModel();
  }

  @override
  void dispose() {
    super.dispose();
    textPhoneController.dispose();
    textEmailController.dispose();
    textNameController.dispose();
    textPasswordController.dispose();
    textConfirmPasswordController.dispose();
    _signUpBloc.dispose();
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
                      hint: 'Email',
                      textController: textEmailController,
                      validationType: 2,
                    ),
                    TextFormField(
                      controller: textPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: obscure,
                      decoration: InputDecoration(
                          errorText: error ? errorText : null,
                          hintText: AppLocalizations.of(context)!.password,
                          hintStyle: const TextStyle(color: kTextFieldColor),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor)),
                          suffixIcon: obscureChange()),
                      onChanged: (value) {
                        setState(() {
                          // Check password
                          if (value.isEmpty ||
                              Validate.checkInvalidateNewPassword(value)) {
                            error = true;
                            errorText = value.isEmpty
                                ? 'Mật khẩu không được để trống'
                                : 'Mật khẩu nên có chữ cái in hoa và kí tự đặc biệt';
                          } else {
                            error = false;
                            errorText = '';
                          }
                        });
                      },
                    ),
                    TextFormField(
                      controller: textConfirmPasswordController,
                      obscureText: obscure,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          errorText: error ? errorText : null,
                          hintText: AppLocalizations.of(context)!.password,
                          hintStyle: const TextStyle(color: kTextFieldColor),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor)),
                          suffixIcon: obscureChange()),
                      onChanged: (value) {
                        setState(() {
                          // Check password
                          if (textPasswordController.text !=
                              textConfirmPasswordController.text) {
                            error = true;
                            errorText = 'Mật khẩu không trùng khớp';
                          } else {
                            error = false;
                            errorText = '';
                          }
                        });
                      },
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
                InkWell(
                  onTap: () async {
                    String email = textEmailController.text;
                    String password = textPasswordController.text;
                    String fullName = textNameController.text;

                    if (email.isEmpty ||
                        password.isEmpty ||
                        fullName.isEmpty ||
                        textConfirmPasswordController.text.isEmpty) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: 'Please fill in all fields',
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final bool signUpStatus = await _signUpViewModel.signUp(
                        email, password, fullName);

                    if (signUpStatus == true) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.success(
                          message: 'Register success',
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInScreen(),
                        ),
                      );
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: 'Email already exists',
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: PrimaryButton(
                    buttonText: AppLocalizations.of(context)!.signUp,
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
                          const Expanded(
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
                          const Expanded(
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
                        child: const LoginOption(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
