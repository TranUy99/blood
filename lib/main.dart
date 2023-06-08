import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/login.dart';

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
      home: LogInScreen(),
    );
  }
}
<<<<<<< HEAD
=======


>>>>>>> 20ceb71834057de0997dcb443612d6f243c8ac5c
