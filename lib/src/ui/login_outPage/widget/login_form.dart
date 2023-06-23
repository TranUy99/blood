import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/log_in_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';

import '../../../constant/colors/theme.dart';

class BuildInputFormLogIn extends StatefulWidget {
  const BuildInputFormLogIn(
      {Key? key,
      required this.textController,
      required this.hint,
      required this.validationType})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  final int validationType;

  @override
  State<BuildInputFormLogIn> createState() => _BuildInputFormLogInState();
}

class _BuildInputFormLogInState extends State<BuildInputFormLogIn> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (widget.validationType == 1 &&
                Validate.invalidateMobile(value)) {
              error = true;
              errorText = 'Invalid phone number';
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
      padding: EdgeInsets.symmetric(vertical: 5),
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
                      errorText = 'Invalid password';
                    } else {
                      error = false;
                      widget.sharedTextPasswordBloc.updateTextField(value);
                    }
                  } else {
                    error = false;
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



// Widget buildInputFormLogIn(
//     String hint, TextEditingController controller) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 5),
//     child: TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: kTextFieldColor),
//         focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: kGreenColor)),
//       ),
//     ),
//   );
// }


// class BuildInputFormPassword extends StatefulWidget {
//   BuildInputFormPassword(
//       {Key? key,
//       required this.hint,
//       required this.obscure,
//       required this.textController,
//       required this.function})
//       : super(key: key);
//   final TextEditingController textController;
//   final String hint;
//   late final bool obscure;
//   final Widget function;

//   @override
//   State<BuildInputFormPassword> createState() => _BuildInputFormPasswordState();
// }

// class _BuildInputFormPasswordState extends State<BuildInputFormPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5),
//       child: TextField(
//         controller: widget.textController,
//         obscureText: widget.obscure,
//         decoration: InputDecoration(
//             hintText: widget.hint,
//             hintStyle: const TextStyle(color: kTextFieldColor),
//             focusedBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: kGreenColor)),
//             suffixIcon: widget.function),
//       ),
//     );
//   }
// }
