import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/change_password/bloc_state/change_password_bloc.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';
import 'package:mobile_store/src/ui/change_password/widget/change_password_form.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../constant/widget/primary_button.dart';

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
                    'Change Password',
                    style: titleText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Column(children: [
                    BuildInputFormChangePassword(
                      hint: 'Old password',
                      textController: textOldPasswordController,
                    ),
                    BuildInputFormPassword(
                      hint: 'New password',
                      obscure: obscure,
                      textController: textNewPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      isConfirm: false,
                    ),
                    BuildInputFormPassword(
                      hint: 'Confirm password',
                      obscure: obscure,
                      textController: textConfirmPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      isConfirm: true,
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    if (textOldPasswordController.text ==
                            textNewPasswordController.text &&
                        textNewPasswordController.text.isNotEmpty &&
                        textOldPasswordController.text.isNotEmpty) {
                      showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                              message: 'The old and new passwords must be different'));
                    }else{
                      {
                        if (Validate.checkInvalidateNewPassword(
                            textNewPasswordController.text) ==
                            false &&
                            Validate.checkNotEqualNewPassword(
                                passwordList()[0], passwordList()[0]) ==
                                false) {
                          changePasswordBloc.updatePassword(
                              textOldPasswordController.text,
                              textNewPasswordController.text);
                          changePasswordBloc.changePassword();
                          showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                  message: 'Password changed successfully'));
                          Navigator.pop(context);
                        } else {
                          showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                  message: 'Invalid information'));
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: const PrimaryButton(
                      buttonText: 'Save',
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
                color: kGreyColor,
              )
            : const Icon(
                Icons.visibility,
                color: kGreyColor,
              ));
  }
}