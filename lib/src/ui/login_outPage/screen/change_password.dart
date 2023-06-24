import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/change_password_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/sign_up_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../state/change_password_state.dart';

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
    var sharedTextBloc2 = sharedTextBloc;
    var sharedTextBloc22 = sharedTextBloc2;
    var sharedTextBloc3 = sharedTextBloc;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: kDefaultPadding,
                  child: Text(
                    'Change Password',
                    style: titleText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Column(children: [
                    BuildInputFormPassword(
                      hint: 'Old password',
                      obscure: obscure,
                      textController: textOldPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      validationType: 0,
                      isConfirm: false,
                    ),
                    BuildInputFormPassword(
                      hint: 'New password',
                      obscure: obscure,
                      textController: textNewPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      validationType: 1,
                      isConfirm: false,
                    ),
                    BuildInputFormPassword(
                      hint: 'Confirm password',
                      obscure: obscure,
                      textController: textConfirmPasswordController,
                      function: obscureChange(),
                      sharedTextPasswordBloc: sharedTextBloc,
                      validationType: 2,
                      isConfirm: true,
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    if (Validate.checkInvalidateNewPassword(
                                passwordList()[0]) ==
                            false &&
                        Validate.checkNotEqualNewPassword(
                                passwordList()[1], passwordList()[2]) ==
                            false) {
                      changePasswordBloc
                          .updatePassword(passwordList() as String);
                      changePasswordBloc.changePassword();
                    } else {
                      showTopSnackBar(Overlay.of(context),
                          CustomSnackBar.error(message: 'Invalid password'));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: PrimaryButton(
                      buttonText: 'Save',
                      onPressed: () {},
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

  // const SizedBox(
  //   height: 20,
  // ),
  // GestureDetector(
  //   onTap: () {
  //     if (Validate.checkInvalidateNewPassword(
  //                 textPasswordController.text) ==
  //             false &&
  //         Validate.checkInvalidateNewPassword(
  //                 textConfirmPasswordController.text) ==
  //             false) {
  //       ChangePasswordBloc.updatePassword(
  //           textOldPasswordController.text,
  //           textNewPasswordController.text);
  //       ChangePasswordBloc.changePassword();
  //       showTopSnackBar(Overlay.of(context),
  //           CustomSnackBar.success(message: 'Yes'));
  //     } else {
  //       showTopSnackBar(Overlay.of(context),
  //           CustomSnackBar.error(message: 'Invalid information'));
  //     }
  //   },
  //   child: Padding(
  //     padding: kDefaultPadding,
  //     child: PrimaryButton(
  //       buttonText: 'Log in',
  //       onPressed: () {
  //         GestureDetector(
  //           onTap: () => Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => const HomePage(),
  //             ),
  //           ),
  //         );
  //           },
  //         ),
  //       ),
  //     ),
  //   ],
  // )),

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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Change Password'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             TextFormField(
  //               decoration: InputDecoration(labelText: 'Old password'),
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return 'Please enter old password';
  //                 }
  //                 return null;
  //               },
  //               onSaved: (value) => _oldPassword = value!,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(labelText: 'New password'),
  //               obscureText: true,
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return 'Please enter new password';
  //                 }
  //                 return null;
  //               },
  //               onSaved: (value) => _newPassword = value!,
  //             ),
  //             TextFormField(
  //               decoration: InputDecoration(labelText: 'Confirm new password'),
  //               obscureText: true,
  //               validator: (value) {
  //                 if (value!.isEmpty) {
  //                   return 'Please re-enter new password';
  //                 }
  //                 return null;
  //               },
  //               onSaved: (value) => _newPassword = value!,
  //             ),
  //             SizedBox(height: 16.0),
  //             ElevatedButton(
  //               onPressed: () {
  //                 if (_formKey.currentState!.validate()) {
  //                   _formKey.currentState!.save();
  //                   _changePassword();
  //                 }
  //               },
  //               child: Text('Save'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

void _changePassword() {}
