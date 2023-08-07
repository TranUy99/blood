import 'package:flutter/material.dart';

const kGreenColor = Color.fromARGB(240, 56, 187, 76);
const kSecondaryColor = Color(0xFF59706F);
const kDarkGreyColor = Color(0xFFA8A8A8);
const kWhiteColor = Color(0xFFFFFFFF);
const kZambeziColor = Color(0xFF5B5B5B);
const kBlackColor = Color(0xFF272726);
const kTextFieldColor = Color(0xFF979797);
const kColorSearchBars = Color(0xffd4d181);
const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);
const kAppBarColor = Color.fromARGB(222, 222, 222, 222);
const kRedColor = Colors.red;
const kBlueColor = Colors.blue;
const kGreyColor = Colors.grey;
const kWhiteGrey = Color.fromARGB(255, 225, 224, 224);
const kYellow = Colors.amber;
const kOrange = Colors.orange;

TextStyle titleText =
    const TextStyle(color: kGreenColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subtitle =
    const TextStyle(color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(color: kYellow, fontSize: 18, fontWeight: FontWeight.w700);

Map<String, Color> colorMap = {
  'red': kRedColor,
  'green': kGreenColor,
  'blue': kBlueColor,
  'white': kWhiteColor,
  'black': kBlackColor,
  'yellow': kYellow,
};
