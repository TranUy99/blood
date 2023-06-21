// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// //import '../../models/http_exception.dart';

// enum AuthMode { signup, login }

// class AuthCard extends StatefulWidget {
//   const AuthCard({
//     super.key,
//   });

//   @override
//   State<AuthCard> createState() => _AuthCardState();
// }

// class _AuthCardState extends State<AuthCard> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.login;
//   bool passenable = true;
//   final Map<String, String> _authData = {
//     'phone number': '',
//     'password': '',
//   };

//   final _isSubmitting = ValueNotifier<bool>(false);
//   final _passwordController = TextEditingController();

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
//     _formKey.currentState!.save();

//     _isSubmitting.value = true;

//     try {
//       if (_authMode == AuthMode.login) {
//         // Log user in
//         await context.read<AuthManager>().login(
//               _authData['email']!,
//               _authData['password']!,
//             );
//       } else {
//         // Sign user up
//         await context.read<AuthManager>().signup(
//               _authData['email']!,
//               _authData['password']!,
//             );
//       }
//     } catch (error) {
//       showErrorDialog(
//           context,
//           (error is HttpException)
//               ? error.toString()
//               : 'Authentication failed');
//     }

//     _isSubmitting.value = false;
//   }

//   void _switchAuthMode() {
//     if (_authMode == AuthMode.login) {
//       setState(() {
//         _authMode = AuthMode.signup;
//       });
//     } else {
//       setState(() {
//         _authMode = AuthMode.login;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Container(
//         height: _authMode == AuthMode.signup ? 480 : 340,
//         width: deviceSize.width * 0.75,
//         child: Form(
//           key: _formKey,
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 _buildEmailField(),
//                 _buildPasswordField(),
//                 if (_authMode == AuthMode.signup) _buildPasswordConfirmField(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ValueListenableBuilder<bool>(
//                   valueListenable: _isSubmitting,
//                   builder: (context, isSubmitting, child) {
//                     if (isSubmitting) {
//                       return const CircularProgressIndicator();
//                     }
//                     return _buildSubmitButton();
//                   },
//                 ),
//                 _buildAuthModeSwitchButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAuthModeSwitchButton() {
//     return TextButton(
//       onPressed: _switchAuthMode,
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
//         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         textStyle: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//       child: Text(
//           '${_authMode == AuthMode.login ? 'Không có tài khoản: Đăng ký tại đây' : 'ĐĂNG NHẬP'}'),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: _submit,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.mainColor,
//         padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//         textStyle: TextStyle(
//           color: Theme.of(context).primaryTextTheme.headline6?.color,
//         ),
//       ),
//       child: Text(_authMode == AuthMode.login ? 'ĐĂNG NHẬP' : 'ĐĂNG KÝ'),
//     );
//   }

//   Widget _buildPasswordConfirmField() {
//     return TextFormField(
//       obscureText: passenable,
//       cursorHeight: 10,
//       enabled: _authMode == AuthMode.signup,
//       decoration: InputDecoration(
//           suffix: IconButton(
//               onPressed: () {
//                 setState(() {
//                   if (passenable) {
//                     passenable = false;
//                   } else {
//                     passenable = true;
//                   }
//                 });
//               },
//               icon: FaIcon(
//                 passenable == true
//                     ? FontAwesomeIcons.eye
//                     : FontAwesomeIcons.eyeSlash,
//                 size: 15,
//               )),
//           labelText: 'Xác thực mật khẩu',
//           prefixIcon: Icon(Icons.password_rounded)),
//       validator: _authMode == AuthMode.signup
//           ? (value) {
//               if (value != _passwordController.text) {
//                 return 'Mật khẩu không trùng khớp';
//               }
//               return null;
//             }
//           : null,
//     );
//   }

//   Widget _buildPasswordField() {
//     return TextFormField(
//       decoration: InputDecoration(
//           suffix: IconButton(
//               onPressed: () {
//                 setState(() {
//                   if (passenable) {
//                     passenable = false;
//                   } else {
//                     passenable = true;
//                   }
//                 });
//               },
//               icon: FaIcon(
//                 passenable == true
//                     ? FontAwesomeIcons.eye
//                     : FontAwesomeIcons.eyeSlash,
//                 size: 15,
//               )),
//           labelText: 'Mật khẩu',
//           prefixIcon: Icon(Icons.password_rounded)),
//       obscureText: passenable,
//       controller: _passwordController,
//       validator: (value) {
//         if (value == null || value.length < 5) {
//           return 'Mật khẩu quá ngắn';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _authData['password'] = value!;
//       },
//     );
//   }

//   Widget _buildEmailField() {
//     return TextFormField(
//       decoration: const InputDecoration(
//           labelText: 'E-Mail', prefixIcon: Icon(Icons.email)),
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty || !value.contains('@')) {
//           return 'Email không tồn tại!';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _authData['email'] = value!;
//       },
//     );
//   }
// }
