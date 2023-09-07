import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/features/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../component/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool obscure = true;
  final ForgotPasswordViewModel _forgotPasswordViewModel =
      ForgotPasswordViewModel();
  bool resentEmail = false;
  bool isSendEmail = false;
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textOTPController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final TextEditingController textRePasswordController =
      TextEditingController();
  bool errorSendEmail = false;
  String errorTextSendEmail = '';
  bool errorOTP = false;
  String errorTextOTP = '';
  bool errorPassword = false;
  String errorTextPassword = '';
  bool errorRePassword = false;
  String errorTextRePassword = '';
  String email = '';

  _sendEmail(String emailSent, String errorMessage) async {
    isSendEmail = await _forgotPasswordViewModel
        .sendEmailForgotPasswordViewModel(emailSent);
    setState(() {});
    if (isSendEmail) {
      showTopSnackBar(Overlay.of(context),
          const CustomSnackBar.info(message: 'Otp that sent via email'));
    } else {
      showTopSnackBar(
          Overlay.of(context), CustomSnackBar.error(message: errorMessage));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textPasswordController.dispose();
    textOTPController.dispose();
    textEmailController.dispose();
    textRePasswordController.dispose();
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
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    child: Text('Forgot password'.toUpperCase(),
                        style: titleText)),
                isSendEmail ? verifiedOTPPage() : sendEmailPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget verifiedOTPPage() {
    CountdownController countdownController =
        CountdownController(autoStart: true);
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: const Text(
                  'Verify code has been sent to your email address\nPlease confirm it and enter your new password'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: TextField(
                cursorColor: kGreenColor,
                textAlign: TextAlign.center,
                maxLength: 4,
                onChanged: (value) {
                  setState(() {
                    if (Validate.checkInvalidateOTPNumber(value) == false) {
                      errorOTP = true;
                      errorTextOTP = 'Invalid OTP number';
                    } else {
                      errorOTP = false;
                    }
                  });
                },
                controller: textOTPController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: errorOTP ? errorTextOTP : null,
                  hintText: 'OTP number',
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kGreenColor)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: TextField(
                maxLength: 32,
                onChanged: (value) {
                  setState(() {
                    if (Validate.checkInvalidateNewPassword(value)) {
                      errorPassword = true;
                      errorTextPassword = textPasswordController.text.isEmpty
                          ? 'Please enter password'
                          : (RegExp(r'^(?=.*[A-Z])(?=.*\d).+$')
                                      .hasMatch(textPasswordController.text) ==
                                  false)
                              ? 'Please enter at least 1 uppercase letter and 1 number'
                              : (RegExp(r'^.{8,32}$').hasMatch(
                                          textPasswordController.text) ==
                                      false)
                                  ? 'Password length between 8 to 32'
                                  : 'Incorrect password';
                    } else {
                      errorPassword = false;
                    }
                  });
                },
                controller: textPasswordController,
                obscureText: obscure,
                decoration: InputDecoration(
                    errorText: errorPassword ? errorTextPassword : null,
                    hintText: 'Password',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kGreenColor)),
                    border: const OutlineInputBorder(),
                    suffixIcon: obscureChange()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: TextField(
                obscureText: obscure,
                controller: textRePasswordController,
                onChanged: (value) {
                  if (value == textPasswordController.text) {
                    errorRePassword = false;
                  } else {
                    errorTextRePassword = textRePasswordController.text.isEmpty
                        ? 'Please enter password again'
                        : 'Password does not match';
                    errorRePassword = true;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                    errorText: errorRePassword ? errorTextRePassword : null,
                    hintText: 'Re-enter Password',
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kGreenColor)),
                    border: const OutlineInputBorder(),
                    suffixIcon: obscureChange()),
              ),
            ),
          ],
        ),
        resentEmail
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Did not send OTP'),
                TextButton(
                  onPressed: () {
                    _sendEmail(email, 'Email that is not send');
                    setState(() {
                      resentEmail = !resentEmail;
                    });
                    countdownController.restart();
                  },
                  child: const Text('Press here',
                      style: TextStyle(color: kGreenColor)),
                )
              ])
            : Countdown(
                controller: countdownController,
                seconds: 120,
                build: (context, time) {
                  return Text('Sent OTP number via email: ${time.toInt()}');
                },
                onFinished: () {
                  setState(() {
                    resentEmail = !resentEmail;
                  });
                },
              ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: InkWell(
            onTap: () async {
              if (errorOTP == false &&
                  errorPassword == false &&
                  errorRePassword == false) {
                bool isChange =
                    await _forgotPasswordViewModel.forgotPasswordViewModel(
                        textOTPController.text, textPasswordController.text);
                if (isChange) {
                  showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                          message: 'Change password successfully'));
                  Navigator.pop(context);
                } else {
                  showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                          message: 'Change password failed'));
                }
              } else {
                showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                        message: 'Change password failed'));
              }
            },
            child: const PrimaryButton(buttonText: 'Verified Email'),
          ),
        ),
      ],
    );
  }

  Widget sendEmailPage() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: TextField(
            onChanged: (value) {
              setState(() {
                if (Validate.invalidateEmail(value)) {
                  setState(() {
                    errorSendEmail = true;
                    errorTextSendEmail = (textEmailController.text == '')
                        ? 'Enter your email'
                        : 'Wrong email';
                  });
                  print(errorTextSendEmail);
                } else {
                  setState(() {
                    errorSendEmail = false;
                  });
                }
              });
            },
            controller: textEmailController,
            decoration: InputDecoration(
              errorText: errorSendEmail ? errorTextSendEmail : null,
              hintText: 'Email',
              hintStyle: const TextStyle(color: kTextFieldColor),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kGreenColor)),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: InkWell(
            onTap: () async {
              setState(() {
                email = textEmailController.text;
              });
              _sendEmail(email, 'Email không tồn tại');
            },
            child: const PrimaryButton(buttonText: 'Send OTP'),
          ),
        ),
      ],
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
