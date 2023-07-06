

import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuildButton(
          icon: Icon(
            Icons.facebook,
            size: 50,
          ),
          backgroundColor: kWhiteColor,
          borderRadcomponents: BorderRadius.circular(50),
        ),
        SizedBox(width: 30),
        BuildButton(
          icon: Image.asset(
            'images/google.jpg',
            height: 40,
            width: 40,
          ),
          backgroundColor: kWhiteColor,
          borderRadcomponents: BorderRadius.circular(50),
        )
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final BorderRadius borderRadcomponents;

  const BuildButton({
    required this.icon,
    required this.backgroundColor,
    required this.borderRadcomponents,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return CircleAvatar(
      radius: mediaQuery.height * 0.03,
      backgroundColor: backgroundColor,
      child: icon,
    );
  }
}
