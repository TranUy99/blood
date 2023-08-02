import 'dart:async';

import 'package:flutter/material.dart';

import '../../login/view/login.dart';


void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    var startState = StartState();
    return startState;
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds:1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LogInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffF5591F),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 240, 241, 241)),
                  (Color.fromARGB(255, 237, 242, 243))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Image.asset("images/logo_mobile.png"),
          )
        ],
      ),
    );
  }
}
