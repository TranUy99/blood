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
<<<<<<< HEAD
            image: AssetImage('images/facebook.jpg'),
=======
            image: AssetImage('images/facebook.png'),
>>>>>>> 20ceb71834057de0997dcb443612d6f243c8ac5c
          ),
          textButton: 'Facebook',
        ),
        BuildButton(
          iconImage: Image(
            height: 20,
            width: 20,
<<<<<<< HEAD
            image: AssetImage('images/google.jpg'),
=======
            image: AssetImage('images/google.png'),
>>>>>>> 20ceb71834057de0997dcb443612d6f243c8ac5c
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
<<<<<<< HEAD
          iconImage,
          SizedBox(width: 5),
          Text(textButton),
=======
          Expanded(
            child: iconImage,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(textButton),
          ),
>>>>>>> 20ceb71834057de0997dcb443612d6f243c8ac5c
        ],
      ),
    );
  }
}
