import 'package:flutter/material.dart';
import 'package:mobile_store/login/srceen/login.dart';

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
