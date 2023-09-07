import 'package:flutter/material.dart';

import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/features/change_password/view_model/change_password_view_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  bool obscurePassword = true;
  bool obscureNewPassword = true;
  bool obscureRepeatPassword = true;
  final ChangePasswordViewModel _changePasswordViewModel = ChangePasswordViewModel();
  bool error = false;
  bool errorNewPassword = false;
  bool errorConfirmPassword = false;
  String errorText = '';
  String errorNewPasswordText = '';
  String errorComFirmPasswordText = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var action;
    return AlertDialog(
      icon: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: Text('${AppLocalizations.of(context)?.changePassword}'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    TextFormField(
                      controller: textPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                          errorText: error ? errorText : null,
                          hintText: '${AppLocalizations.of(context)?.oldPassword}',
                          hintStyle: const TextStyle(color: kTextFieldColor),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: obscurePassword
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: kGreenColor,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: kGreenColor,
                                    ))),
                      onChanged: (value) {
                        setState(() {
                          // Check password
                          if (value.isEmpty || Validate.checkInvalidateNewPassword(value)) {
                            error = true;
                            errorText = value.isEmpty
                                ? '${AppLocalizations.of(context)?.passwordCanNotBeBlank}'
                                : '${AppLocalizations.of(context)?.passwordShouldHaveCapitalLettersAndSpecialCharacters}';
                          } else {
                            error = false;
                            errorText = '';
                          }
                        });
                      },
                    ),
                    TextFormField(
                      controller: textNewPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: obscureNewPassword,
                      decoration: InputDecoration(
                          errorText: errorNewPassword ? errorNewPasswordText : null,
                          hintText: '${AppLocalizations.of(context)?.newPassword}',
                          hintStyle: const TextStyle(color: kTextFieldColor),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureNewPassword = !obscureNewPassword;
                                });
                              },
                              icon: obscureNewPassword
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: kGreenColor,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: kGreenColor,
                                    ))),
                      onChanged: (value) {
                        setState(() {
                          // Check password
                          if (value.isEmpty || Validate.checkInvalidateNewPassword(value)) {
                            errorNewPassword = true;
                            errorNewPasswordText = value.isEmpty
                                ? '${AppLocalizations.of(context)?.passwordCanNotBeBlank}'
                                : '${AppLocalizations.of(context)?.passwordShouldHaveCapitalLettersAndSpecialCharacters}';
                          } else {
                            errorNewPassword = false;
                            errorNewPasswordText = '';
                          }
                        });
                      },
                    ),
                    TextFormField(
                      controller: textConfirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: obscureRepeatPassword,
                      decoration: InputDecoration(
                          errorText: errorConfirmPassword ? errorComFirmPasswordText : null,
                          hintText: '${AppLocalizations.of(context)?.repeatPassword}',
                          hintStyle: const TextStyle(color: kTextFieldColor),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureRepeatPassword = !obscureRepeatPassword;
                                });
                              },
                              icon: obscureRepeatPassword
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: kGreenColor,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: kGreenColor,
                                    ))),
                      onChanged: (value) {
                        setState(() {
                          // Check password
                          if (textConfirmPasswordController.text !=
                              textNewPasswordController.text) {
                            errorConfirmPassword = true;
                            errorComFirmPasswordText =
                                '${AppLocalizations.of(context)?.passwordsDoNotMatch}';
                          } else {
                            errorConfirmPassword = false;
                            errorComFirmPasswordText = '';
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          String oldPassword = textPasswordController.text;
                          String newPassword = textNewPasswordController.text;
                          String confirmPassword = textConfirmPasswordController.text;
                          final changPassword = await _changePasswordViewModel.changePassword(
                              oldPassword, newPassword);
                          if (oldPassword.isNotEmpty ||
                              newPassword.isNotEmpty ||
                              confirmPassword.isNotEmpty) {
                            if (changPassword == true) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                    message:
                                        '${AppLocalizations.of(context)?.changePasswordSuccess}',
                                    backgroundColor: kGreenColor),
                              );
                              // Navigator.pop(context);
                              // ignore: use_build_context_synchronously
                            } else {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message:
                                      '${AppLocalizations.of(context)?.theOldPasswordIsIncorrect}',
                                  backgroundColor: kRedColor,
                                ),
                              );
                              // Navigator.pop(context);
                            }
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message:
                                    '${AppLocalizations.of(context)?.pleaseEnterFullInformation}',
                                backgroundColor: kRedColor,
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(kGreenColor),
                        ),
                        child:  Text('${AppLocalizations.of(context)?.save}'),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(kRedColor),
                        ),
                        child:Text('${AppLocalizations.of(context)?.close}'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
