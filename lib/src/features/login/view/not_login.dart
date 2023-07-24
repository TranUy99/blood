import 'package:flutter/material.dart';

import '../../component/primary_button.dart';
import 'login.dart';

class NotLogin extends StatefulWidget {
  const NotLogin({Key? key}) : super(key: key);

  @override
  State<NotLogin> createState() => _NotLoginState();
}

class _NotLoginState extends State<NotLogin> {
  // final LogInBloc loginBloc = LogInBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not login yet',
            style: TextStyle(fontSize: 60),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Image.asset('assets/images/not_login.png'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ));
              },
              child: const PrimaryButton(buttonText: 'Login')),
        ],
      ),
    );
  }
}
