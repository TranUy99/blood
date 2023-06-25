import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/change_password_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';

import '../../../constant/colors/theme.dart';

class BuildInputFormChangePassword extends StatefulWidget {
  const BuildInputFormChangePassword(
      {Key? key,
      required this.textController,
      required this.hint,
      required this.validationType})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  final int validationType;

  get sharedTextPasswordBloc => null;

  @override
  State<BuildInputFormChangePassword> createState() =>
      _BuildInputFormChangePasswordState();
}

class _BuildInputFormChangePasswordState
    extends State<BuildInputFormChangePassword> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (widget.validationType == 0 &&
                Validate.checkInvalidateOldPassword(value)) {
              error = true;
              errorText = 'Invalid old password';
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
  final SharedTextPasswordBloc sharedTextPasswordBloc;
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
      padding: EdgeInsets.symmetric(vertical: 6),
      child: StreamBuilder<String>(
          stream: widget.sharedTextPasswordBloc.textFieldStream,
          builder: (context, snapshot) {
            return TextField(
              onTap: () => print(snapshot.data),
              onChanged: (value) {
                setState(() {
                  if (widget.isConfirm == false) {
                    if (Validate.checkInvalidateNewPassword(value)) {
                      error = true;
                      errorText = 'Invalid new password';
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
