import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/forgot_password/view/forgot_password.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:mobile_store/src/features/login/view_model/login_view_model.dart';
import 'package:mobile_store/src/features/login/widget/login_form.dart';
import 'package:mobile_store/src/features/verified_email/view/verified_email.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../component/primary_button.dart';
import '../../sign_up/view/sign_up.dart';
import '../bloc/login_bloc.dart';
import 'login_option.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  final LoginBloc _loginBloc = LoginBloc();
  late final LoginViewModel _loginViewModel;
  bool obscure = true;
  bool isRemember = false;

  navigationHomePage() {
    Get.offAll(const NavigationHomePage());
  }

  navigationVerifiedPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifiedEmail(),
        ));
  }

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
    print('${getUser.email} - ${getUser.password} - ${getUser.isRemember}');
    isRemember = getUser.isRemember ?? false;
    if(isRemember){
      textEmailController.text = getUser.email ?? '';
      textPasswordController.text = getUser.password ?? '';
    }
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    _loginBloc.dispose();
    textEmailController.dispose();
    super.dispose();
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
                      CheckBoxLogIn(
                        text: AppLocalizations.of(context)!.rememberMe,
                        isRemember: isCheckCheckbox(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),),
                          );
                        },
                        child: Text(
                          '${AppLocalizations.of(context)!.forgotPassword}?',
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: InkWell(
                    onTap: () async {
                      // String email = 'vanhau27062001@gmail.com';
                      // String password = '1234567Hau';
                      // String email = 'tranuy0907@gmail.com';
                      // String password = 'Tranuy1.';
                      String email = textEmailController.text;
                      String password = textPasswordController.text;
                      // String email = 'yukatanguyen545@gmail.com';
                      // String password = 'Candidate123';
                      final int? loginStatus = await _loginViewModel.login(
                          email, password, isRemember);

                      if (email.isNotEmpty && password.isNotEmpty) {
                        if (loginStatus == LoginStatusEnum.successLogin.index) {
                          showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                  message: 'Login success'));
                          indexScreen = 0;
                          navigationHomePage();
                        } else if (loginStatus ==
                            LoginStatusEnum.successLoginWithoutVerified.index) {
                          showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.info(
                                  message:
                                      'Please enter your otp number that was sent via email'));
                          indexScreen = 0;
                          navigationVerifiedPage();
                        } else {
                          showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                  message: 'Login failed'));
                        }
                      } else {
                        showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(
                                message: 'Please fill in all fields'));
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
                        child: const LoginOption(),
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
                                      builder: (context) => SignUpScreen()));
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

  Widget isCheckCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRemember = !isRemember;
        });
      },
      child: Container(
        width: MediaQuery.of(context).devicePixelRatio * 7,
        height: MediaQuery.of(context).devicePixelRatio * 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: kDarkGreyColor)),
        child: isRemember
            ? const Icon(Icons.check, size: 17, color: Colors.green)
            : null,
      ),
    );
  }
}
