import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/sign_up_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/event/sign_up_event.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/sign_up_form.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/login_option.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:provider/provider.dart';
import '../state/sign_up_state.dart';
import 'login.dart';

class SignUpProvider extends StatelessWidget {
  const SignUpProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SharedTextPasswordBloc(),
        )
      ],
      child: const SignUpScreen(),
    );
  }
}

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
  bool obscure = true;
  final bloc = SignUpBloc();

  List<String> registerList() {
    List<TextEditingController> textEditingControllerList = [
      textNameController,
      textPhoneController,
      textEmailController,
      textPasswordController
    ];
    List<String> listOfRegister = [];
    for (TextEditingController controllers in textEditingControllerList) {
      listOfRegister.add(controllers.text);
    }
    return listOfRegister;
  }

  @override
  Widget build(BuildContext context) {
    final sharedTextPasswordBloc = SharedTextPasswordBloc();
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
                    'REGISTER',
                    style: titleText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(children: [
                    buildInputFormSignIn('Full name', textNameController),
                    buildInputFormSignIn('Phone number', textPhoneController),
                    buildInputFormSignIn('Email', textEmailController),
                    buildInputFormPassword(
                      hint: 'Password',
                      obscure: obscure,
                      textController: textPasswordController,
                      function: obscureChange(),
                    ),
                    buildInputFormPassword(
                      hint: 'Confirm Password',
                      obscure: obscure,
                      textController: textConfirmPasswordController,
                      function: obscureChange(),
                    ),
                    StreamBuilder<SignUpState>(
                      stream: bloc.stateController.stream,
                      initialData: bloc.state,
                      builder: (context, snapshot) {
                        return Text(snapshot.data!.onUpdated.join(', '));
                      },
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: const CheckBox('Agree to term and conditions.'),
                ),
                GestureDetector(
                  onTap: () {
                    return bloc.eventSignUpController.sink
                        .add(SignUpEvent(registerList()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: PrimaryButton(
                      buttonText: 'Sign up',
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    '${AppLocalizations.of(context)!.orSignInUsing}:',
                    style: subtitle.copyWith(color: kBlackColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: LoginOption(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
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
