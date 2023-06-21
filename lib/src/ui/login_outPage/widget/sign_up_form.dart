import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/sign_up_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/event/sign_up_event.dart';
import 'package:mobile_store/src/ui/login_outPage/state/sign_up_state.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors/theme.dart';
import '../validate.dart';

Widget buildInputFormSignIn(String hint, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(

      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kTextFieldColor),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kGreenColor)),
      ),
    ),
  );
}

class buildInputFormPassword extends StatefulWidget {
  const buildInputFormPassword(
      {Key? key,
      required this.hint,
      required this.obscure,
      required this.textController,
      required this.isObscure, required this.isConfirm, required this.haha, required this.provider})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  final bool obscure;
  final Widget isObscure;
  final bool isConfirm;
  final String haha;
  final SharedTextPasswordBloc provider;

  @override
  State<buildInputFormPassword> createState() => _buildInputFormPasswordState();
}

class _buildInputFormPasswordState extends State<buildInputFormPassword> {
  bool error = false;
  final bloc = OnChangePasswordBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: StreamBuilder<OnChangePasswordState>(
        stream: bloc.stateOnChangePasswordController.stream,
        builder: (context, snapshot) {
          String passwordState = snapshot.data?.onChangePasswordState ?? '';
          return TextField(
            onTap: () {
              print(widget.provider.sharedText);
            },
            onChanged: (value) => widget.provider.sharedText = value,
            controller: widget.textController,
            obscureText: widget.obscure,
            decoration: InputDecoration(
              errorText: error? 'haah': null,
                hintText: widget.hint,
                hintStyle: const TextStyle(color: kTextFieldColor),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kGreenColor)),
                suffixIcon: widget.isObscure),
          );
        }
      ),
    );
  }
}


