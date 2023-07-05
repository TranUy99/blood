import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/widget/validate.dart';

import '../../../constant/colors/theme.dart';
import '../../change_password/bloc_state/change_password_bloc.dart';
import '../bloc_state/sign_up_bloc.dart';

class BuildInputFormSignIn extends StatefulWidget {
  const BuildInputFormSignIn(
      {Key? key,
      required this.textController,
      required this.hint,
      required this.validationType})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  final int validationType;

  @override
  State<BuildInputFormSignIn> createState() => _BuildInputFormSignInState();
}

class _BuildInputFormSignInState extends State<BuildInputFormSignIn> {
  bool error = false;
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (widget.validationType == 0 && Validate.validFullName(value)) {
              error = true;
              errorText = 'Invalid name';
            } else if (widget.validationType == 1 &&
                Validate.invalidateMobile(value)) {
              error = true;
              errorText = 'Invalid phone number';
            } else if (widget.validationType == 2 &&
                Validate.invalidateEmail(value)) {
              error = true;
              errorText = 'Invalid email';
            } else {
              error = false;
            }
          });
        },
        controller: widget.textController,
        decoration: InputDecoration(
          errorText: error ? errorText : null,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor)),
        ),
      ),
    );
  }
}

class BuildInputFormPassword extends StatefulWidget {
  BuildInputFormPassword(
      {Key? key,
      required this.hint,
      required this.obscure,
      required this.textController,
      required this.function,
      required this.sharedTextPasswordBloc,
      required this.isConfirm})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  late final bool obscure;
  final Widget function;
  final SignUpTexPasswordBloc sharedTextPasswordBloc;
  final bool isConfirm;
  @override
  State<BuildInputFormPassword> createState() => _BuildInputFormPasswordState();
}

class _BuildInputFormPasswordState extends State<BuildInputFormPassword> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
      child: StreamBuilder<String>(
          stream: widget.sharedTextPasswordBloc.textFieldStream,
          builder: (context, snapshot) {
            return TextField(
              onChanged: (value) {
                setState(() {
                  if (widget.isConfirm == false) {
                    if (Validate.checkInvalidateNewPassword(value)) {
                      error = true;
                      errorText = 'Invalid password';
                    } else {
                      error = false;
                      widget.sharedTextPasswordBloc.updateTextField(value);
                    }
                  } else {
                    if (Validate.checkNotEqualNewPassword(
                        snapshot.data ?? '', value)) {
                      error = true;
                      errorText = 'Invalid confirm password';
                    } else {
                      error = false;
                    }
                  }
                });
              },
              controller: widget.textController,
              obscureText: widget.obscure,
              decoration: InputDecoration(
                  errorText: error ? errorText : null,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: kTextFieldColor),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kGreenColor)),
                  suffixIcon: widget.function),
            );
          }),
    );
  }
}

class CheckBoxSignIn extends StatefulWidget {
  final String text;
  final Widget isCheck;
  const CheckBoxSignIn({super.key, required this.text, required this.isCheck});

  @override
  _CheckBoxSignInState createState() => _CheckBoxSignInState();
}

class _CheckBoxSignInState extends State<CheckBoxSignIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isCheck,
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(widget.text),
      ],
    );
  }
}
