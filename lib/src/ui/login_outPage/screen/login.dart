import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/sign_up.dart';

import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_option.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import '../state/log_in_state.dart';
import '../bloc/log_in_bloc.dart';
import '../event/log_in_event.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  var phoneErr = "Tài khoản không hợp lệ";
  var passErr = "Mật khẩu phải trên 8 ký tự";
  var phoneInvalid = false;
  var passInvalid = false;
  bool obscure = true;
  final bloc = LogInBloc();

  List<String> loginList() {
    List<TextEditingController> textEditingControllerList = [
      textPhoneController,
      textPasswordController
    ];
    List<String> listOfLogin = [];
    for (TextEditingController controllers in textEditingControllerList) {
      listOfLogin.add(controllers.text);
    }
    return listOfLogin;
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'LOGIN',
                style: titleText,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(children: [
                //buildInputFormLogIn('Phone number', textPhoneController),
                buildInputFormLogIn(
                  'Phone number',
                  textPhoneController,
                  // errorText: phoneInvalid ? phoneErr : null,
                ),
                buildInputFormPassword(
                  hint: 'Password',
                  obscure: obscure,
                  // textController: textPasswordController,
                  textController: textPasswordController,
                  // errorText: passInvalid ? passErr : null,
                  function: obscureChange(),
                ),
                StreamBuilder<LogInState>(
                  stream: bloc.stateController.stream,
                  initialData: bloc.state,
                  builder: (context, snapshot) {
                    return Text(snapshot.data!.onUpdated.join(', '));
                  },
                )
              ]),
            ),

            // Padding(
            //   padding: kDefaultPadding,
            //   child: LogInForm(),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Padding(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckBox('Save account'),
                  // GestureDetector(
                  //   onTap(){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassWordScreen()));
                  //   },
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: kZambeziColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            GestureDetector(
              // onTap: () {
              //   return bloc.eventLogInController.sink
              //       .add(LogInEvent(loginList()));
              // },
              // GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    )),
              child: Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(
                  buttonText: 'Log in',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or Log in with:',
                style: subtitle.copyWith(color: kBlackColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: LoginOption(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
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
                      'Register',
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
    );
    return scaffold;
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

  // goToHomePage(BuildContext context) {
  //   print('object');
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const HomePage(),
  //       ));
  //}

  void onLogInClicked() {
    setState(() {
      if (textPhoneController.text.length == 10 &&
          textPhoneController.text.contains("0")) {
        phoneInvalid = true;
      } else {
        phoneInvalid = false;
      }

      if (textPasswordController.text.length > 8 &&
          textPasswordController.text.contains("0")) {
        passInvalid = true;
      } else {
        passInvalid = false;
      }

      if (!phoneInvalid && !passInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

//ResetPassWordScreen() {}
}

