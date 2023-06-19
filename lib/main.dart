import 'package:flutter/material.dart';
import 'package:mobile_store/src/login-outPage/login.dart';
// import 'package:mobile_store/homePage/home_page.dart';

import 'homePage/screen/home_page.dart';

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
        home: LogInScreen());
    // home: HomePage());
  }
}
