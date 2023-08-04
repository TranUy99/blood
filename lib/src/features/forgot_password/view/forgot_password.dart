import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/features/forgot_password/view_model/forgot_password_view_model.dart';
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
  bool isSendEmail = true;
  TextEditingController textEmailController = TextEditingController();
  bool errorSendEmail = false;
  String errorTextSendEmail = '';

  _sendEmail(String email) async {
    try {
      _forgotPasswordViewModel.sendEmailForgotPasswordViewModel(email);
    } catch (e) {
      print('Send email error: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _sendEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child:
                      Text('Forgot password'.toUpperCase(), style: titleText)),
              // isSendEmail? sendEmailPage(): verifiedOTPPage(),
              sendEmailPage()
            ],
          ),
        ),
      ),
    );
  }

  // Widget verifiedOTPPage(){
  //   CountdownController countdownController = CountdownController(autoStart: true);
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(
  //             vertical: MediaQuery.of(context).size.height * 0.05,
  //             horizontal: MediaQuery.of(context).size.width * 0.25),
  //         child: TextField(
  //           textAlign: TextAlign.center,
  //           maxLength: 4,
  //           onChanged: (value) {
  //             setState(() {
  //               if (Validate.checkInvalidateOTPNumber(value) == false) {
  //                 error = true;
  //                 errorText = 'Invalid OTP number';
  //               } else {
  //                 error = false;
  //               }
  //             });
  //           },
  //           style: const TextStyle(fontSize: 25),
  //           controller: textOTPController,
  //           decoration: InputDecoration(
  //             errorText: error ? errorText : null,
  //             hintText: 'OTP number',
  //             hintStyle: const TextStyle(color: kTextFieldColor),
  //             focusedBorder: const UnderlineInputBorder(
  //                 borderSide: BorderSide(color: kGreenColor)),
  //           ),
  //         ),
  //       ),
  //       resentEmail
  //           ? Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const Text('Did not send OTP'),
  //             TextButton(
  //               onPressed: () {
  //                 _sendEmail();
  //                 showTopSnackBar(
  //                     Overlay.of(context),
  //                     const CustomSnackBar.info(
  //                         message:
  //                         'Please enter your otp number that was sent via email'));
  //                 setState(() {
  //                   resentEmail = !resentEmail;
  //                 });
  //                 countdownController.restart();
  //               },
  //               child: Text('Press here'),
  //             )
  //           ])
  //           : Countdown(
  //         controller: countdownController,
  //         seconds: 120,
  //         build: (context, time) {
  //           return Text(
  //               'Sent OTP number via email: ${time.toInt()}');
  //         },
  //         onFinished: () {
  //           setState(() {
  //             resentEmail = !resentEmail;
  //           });
  //         },
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(
  //             top: MediaQuery.of(context).size.height * 0.03),
  //         child: InkWell(
  //           onTap: () async {
  //             String otpNumber = textOTPController.text;
  //             bool? isVerified =
  //             await verifiedEmailViewModel.activeOTP(otpNumber);
  //             if (isVerified) {
  //               showTopSnackBar(
  //                   Overlay.of(context),
  //                   const CustomSnackBar.success(
  //                       message: 'Login success'));
  //               Get.offAll(const NavigationHomePage());
  //             } else {
  //               showTopSnackBar(
  //                   Overlay.of(context),
  //                   const CustomSnackBar.error(
  //                       message: 'Wrong OTP number'));
  //             }
  //           },
  //           child: const PrimaryButton(buttonText: 'Verified Email'),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
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
                        : 'Incorrect email';
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
              String email = textEmailController.text;
              isSendEmail = await _forgotPasswordViewModel
                  .sendEmailForgotPasswordViewModel(email);
              if (isSendEmail) {
                showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.info(
                        message: 'Otp that sent via email'));
              } else {
                showTopSnackBar(Overlay.of(context),
                    const CustomSnackBar.error(message: 'Wrong email'));
              }
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
