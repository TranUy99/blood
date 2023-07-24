import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:mobile_store/src/features/verified_email/verified_email_view_model/verified_email_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../constant/color/color.dart';
import '../../../constant/utils/validate.dart';
import '../../component/primary_button.dart';

class VerifiedEmail extends StatefulWidget {
  const VerifiedEmail({Key? key}) : super(key: key);

  @override
  State<VerifiedEmail> createState() => _VerifiedEmailState();
}

class _VerifiedEmailState extends State<VerifiedEmail> {
  bool error = false;
  String? errorText;
  TextEditingController textOTPController = TextEditingController();
  VerifiedEmailViewModel verifiedEmailViewModel = VerifiedEmailViewModel();

  _sendEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString('email');
    verifiedEmailViewModel.sendEmail(email!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sendEmail();
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
                        'Verified Email'.toUpperCase(),
                        style: titleText)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.25),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 4,
                    onChanged: (value) {
                      setState(() {
                        if (Validate.checkInvalidateOTPNumber(value) == false) {
                          error = true;
                          errorText = 'Invalid OTP number';
                        } else {
                          error = false;
                        }
                      });
                    },
                    style: const TextStyle(fontSize: 25),
                    controller: textOTPController,
                    decoration: InputDecoration(
                      errorText: error ? errorText : null,
                      hintText: 'OTP number',
                      hintStyle: const TextStyle(color: kTextFieldColor),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kGreenColor)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: InkWell(
                    onTap: () async {
                      String otpNumber = textOTPController.text;
                      bool? isVerified = await verifiedEmailViewModel.activeOTP(otpNumber);
                      if (isVerified) {
                        showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.success(
                                message: 'Login success'));
                        Get.offAll(NavigationHomePage());
                      } else {
                        showTopSnackBar(Overlay.of(context),
                            const CustomSnackBar.error(message: 'Error'));
                      }
                    },
                    child: const PrimaryButton(
                        buttonText: 'Verified Email'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
