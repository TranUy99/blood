import 'package:flutter/material.dart';
import 'package:mobile_store/ui/homePage/home_page.dart';
//import 'package:mobile_store/ui/login/srceen/login.dart';
import 'package:mobile_store/ui/login/srceen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mobile Store",
        theme: ThemeData(fontFamily: 'Poppins'),
        // home: SplashScreen(),
        home: LoginPage());
        //home: HomePage());
  }
}
