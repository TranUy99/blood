// import 'package:flutter/material.dart';
// import 'package:mobile_store/src/constant/utils/validate.dart';
// import 'package:mobile_store/src/features/change_password/bloc/change_password_bloc.dart';

// import '../../../constant/color/color.dart';

// class BuildInputFormChangePassword extends StatefulWidget {
//   const BuildInputFormChangePassword({
//     Key? key,
//     required this.textController,
//     required this.hint,
//     required this.color,
//     required this.suffixIcon,
//     required this.obscure,
//   }) : super(key: key);
//   final TextEditingController textController;
//   final String hint;
//   final Color color;
//   final Widget suffixIcon;
//   final bool obscure;
//   get sharedTextPasswordBloc => null;

//   @override
//   State<BuildInputFormChangePassword> createState() =>
//       _BuildInputFormChangePasswordState();
// }

// class _BuildInputFormChangePasswordState
//     extends State<BuildInputFormChangePassword> {
//   bool error = false;
//   String errorText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: TextField(
//         onChanged: (value) {
//           setState(() {
//             if (Validate.checkInvalidateOldPassword(value)) {
//               error = true;
//               errorText = 'Invalid old password';
//             } else {
//               error = false;
//             }
//           });
//         },
//         controller: widget.textController,
//         obscureText: widget.obscure,
//         decoration: InputDecoration(
//           errorText: error ? errorText : null,
//           hintText: widget.hint,
//           hintStyle: const TextStyle(color: kTextFieldColor),
//           focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: kGreenColor)),
//           suffixIcon: widget.suffixIcon,
//         ),
//       ),
//     );
//   }
// }

// class BuildInputFormPassword extends StatefulWidget {
//   const BuildInputFormPassword(
//       {Key? key,
//       required this.hint,
//       required this.obscure,
//       required this.textController,
//       required this.function,
//       required this.color,
    
//       required this.isConfirm})
//       : super(key: key);
//   final TextEditingController textController;
//   final String hint;
//   final bool obscure;
//   final Widget function;
 
//   final bool isConfirm;
//   final Color color;

//   @override
//   State<BuildInputFormPassword> createState() => _BuildInputFormPasswordState();
// }

// class _BuildInputFormPasswordState extends State<BuildInputFormPassword> {
//   bool error = false;
//   String errorText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: StreamBuilder<String>(
//           stream: widget.sharedTextPasswordBloc.textFieldStream,
//           builder: (context, snapshot) {
//             return TextField(
//               onTap: () => (),
//               onChanged: (value) {
//                 setState(() {
//                   if (widget.isConfirm == false) {
//                     if (Validate.checkInvalidateNewPassword(value)) {
//                       error = true;
//                       errorText = 'Invalid new password';
//                     } else {
//                       error = false;
//                       widget.sharedTextPasswordBloc.updateTextField(value);
//                     }
//                   } else {
//                     if (Validate.checkNotEqualNewPassword(
//                         snapshot.data ?? '', value)) {
//                       error = true;
//                       errorText = 'Invalid confirm password';
//                     } else {
//                       error = false;
//                     }
//                   }
//                 });
//               },
//               controller: widget.textController,
//               obscureText: widget.obscure,
//               decoration: InputDecoration(
//                   errorText: error ? errorText : null,
//                   hintText: widget.hint,
//                   hintStyle: const TextStyle(color: kTextFieldColor),
//                   focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: kGreenColor)),
//                   suffixIcon: widget.function),
//             );
//           }),
//     );
//   }
// }
