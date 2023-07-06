import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';

import 'package:mobile_store/src/constant/widget/validate.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../profilePage/screen/profile_page.dart';
import '../bloc/change_password_bloc.dart';
import '../widget/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textNewPasswordController = TextEditingController();
  TextEditingController textOldPasswordController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();
  bool obscure = true;
  ChangePasswordBloc changePasswordBloc = ChangePasswordBloc();
  SharedTextPasswordBloc sharedTextBloc = SharedTextPasswordBloc();
  List<String> passwordList() {
    List<TextEditingController> textEditingControllerList = [
      textConfirmPasswordController,
      textNewPasswordController,
      textOldPasswordController,
    ];
    List<String> listOfPassword = [];
    for (TextEditingController controllers in textEditingControllerList) {
      listOfPassword.add(controllers.text);
    }
    return listOfPassword;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sharedTextBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var action;
    return AlertDialog(
      icon: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                  child: const Text('CHANGE PASSWORD',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: <Widget>[
                      BuildInputFormChangePassword(
                        hint: 'Old password',
                        color: kGreenColor,
                        textController: textOldPasswordController,
                      ),
                      BuildInputFormPassword(
                        hint: 'New password',
                        color: kGreenColor,
                        obscure: obscure,
                        textController: textNewPasswordController,
                        function: obscureChange(),
                        sharedTextPasswordBloc: sharedTextBloc,
                        isConfirm: false,
                      ),
                      BuildInputFormPassword(
                        hint: 'Repeat new password',
                        color: kGreenColor,
                        obscure: obscure,
                        textController: textConfirmPasswordController,
                        function: obscureChange(),
                        sharedTextPasswordBloc: sharedTextBloc,
                        isConfirm: true,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (textOldPasswordController.text == textNewPasswordController.text &&
                        textNewPasswordController.text.isNotEmpty &&
                        textOldPasswordController.text.isNotEmpty) {
                      showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'The old and new passwords must be different'));
                    } else {
                      {
                        if (Validate.checkInvalidateNewPassword(textNewPasswordController.text) == false &&
                            Validate.checkNotEqualNewPassword(passwordList()[0], passwordList()[0]) == false) {
                          changePasswordBloc.updatePassword(textOldPasswordController.text, textNewPasswordController.text);
                          changePasswordBloc.changePassword();
                          showTopSnackBar(Overlay.of(context), const CustomSnackBar.success(message: 'Password changed successfully'));
                          Navigator.pop(context);
                        } else {
                          showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'Invalid information'));
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => YourInformation(),
                            //   ),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                           child: const Text('Save'),
                        ),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
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
