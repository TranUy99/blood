import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../login_outPage/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var darkGrayColor;

  var whiteColor;

  var Get;

  @override
  Widget build(BuildContext context) {
    const textSpan = TextSpan(
      //text: AppLocalizations.of(context)!.youarenotloggedin,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Container(
            color: whiteColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: darkGrayColor,
                      minRadius: 50,
                      child: GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('images/user.png')),
                      )),
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: 'Chào',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          )
                        ]),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: const StrutStyle(fontSize: 20.0),
                            text: TextSpan(
                              text: "Đăng nhập/Đăng kí",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => LogInScreen()),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SearchBar(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
