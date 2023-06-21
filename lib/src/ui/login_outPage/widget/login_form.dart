import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/bloc/log_in_bloc.dart';
import 'package:mobile_store/src/ui/login_outPage/validate.dart';

import '../../../constant/colors/theme.dart';

class BuildInputFormLogIn extends StatefulWidget {
  const BuildInputFormLogIn(
      {Key? key,
      required this.textController,
      required this.hint, required this.validationType})
      : super(key: key);
  final TextEditingController textController;
  final String hint;
  final int validationType;

  @override
  State<BuildInputFormLogIn> createState() => _BuildInputFormLogInState();
}

class _BuildInputFormSignInState extends State<BuildInputFormLogIn> {
  bool error = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if(widget.validationType == 1 && Validate.invalidateMobile(value)){
              error = true;
              errorText = 'Invalid phone number';
            } else{
              error = false;
            }
          });
        },
        controller: widget.textController,
        decoration: InputDecoration(
          errorText: error ? errorText: null,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: kTextFieldColor),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kGreenColor)),
        ),
      ),
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


// class buildInputFormPassword extends StatefulWidget {
//   buildInputFormPassword(
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
//   State<buildInputFormPassword> createState() => _buildInputFormPasswordState();
// }

// class _buildInputFormPasswordState extends State<buildInputFormPassword> {
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
