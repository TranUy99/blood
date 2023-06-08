import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildButton(
          iconImage: Image(
            height: 20,
            width: 20,
            image: AssetImage('image/facebook.jpg'),
          ),
          textButton: 'Facebook',
        ),
        BuildButton(
          iconImage: Image(
            height: 20,
            width: 20,
            image: AssetImage('image/google.jpg'),
          ),
          textButton: 'Google',
        )
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String textButton;

  BuildButton({required this.iconImage, required this.textButton});

  @override
  Widget build(BuildContext context) {
    var mediaQuerry = MediaQuery.of(context).size;
    return Container(
      height: mediaQuerry.height * 0.06,
      width: mediaQuerry.width * 0.36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconImage,
          SizedBox(width: 5),
          Text(textButton),
        ],
      ),
    );
  }
}
