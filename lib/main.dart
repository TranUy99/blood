import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mobile_store/src/ui/homePage/home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/login.dart';
import 'package:mobile_store/src/ui/login_outPage/splash_screen.dart';
=======

import 'login_outPage/login.dart';
>>>>>>> a6d8af267a091c5282c11561f88a5e7adc830689

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
<<<<<<< HEAD
        home: LogInScreen());
=======
        home: LogInScreen()
    );
    // home: HomePage());
>>>>>>> a6d8af267a091c5282c11561f88a5e7adc830689
  }
}
