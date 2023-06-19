import 'package:flutter/material.dart';
// import 'package:mobile_store/ui/login/srceen/signup.dart';
// import 'package:mobile_store/ui/login/srceen/forgot_pass.dart';
import 'package:mobile_store/theme.dart';

// import 'package:mobile_store/ui/widget//checkbox.dart';
// import 'package:mobile_store/ui/widget/login_form.dart';
// import 'package:mobile_store/ui/widget/login_option.dart';
// import 'package:mobile_store/ui/widget/primary_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _phonenumberController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _phonenumberErr = "SỐ diện thoại không hợp lệ";
  var _passErr = "Mật khẩu không hợp lệ";\
  var _phonenumberInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kDefaultPadding,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Padding(padding: kDefaultPadding,
            child: Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: kBlackColor,
              ),
              child: FlutterLogo(),
            ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0,0,0,60),
            child: Text("LOG IN", style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 30),)
            
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0,0,0,40),
              child:TextField(
                style: TextStyle(fontSize: 18, color: Colors.black ),
              decoration: InputDecoration(labelText: "Phone Number", labelStyle: TextStyle(color: kTextFieldColor, fontSize: 15)),
            ) ,
            ),
            Stack(
              children: <Widget> [
                Padding(padding: const EdgeInsets.fromLTRB(0,0,0,40),
                child: TextField(
                  
                ),)
              ],
            )
          ],
        )
      )
    );
  }
}