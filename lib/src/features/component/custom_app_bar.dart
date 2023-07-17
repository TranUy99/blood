import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/color/color.dart';
import '../home_page/view/navigation_home_page.dart';
import '../home_page/widget/menu_button.dart';
import '../search/view/search.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
        ),
        color: kDarkGreyColor,
        boxShadow: const [BoxShadow(blurRadius: 50.0)],
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuButton(),
                Search(),
              ],
            ),
          ),
          successLoginState.onLoginState
              ?
          Padding (
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nameUser ?? 'null'),
                TextButton(onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.remove('email');
                  preferences.remove('id');
                  preferences.remove('token');
                  preferences.remove('password');
                  successLoginState.onLoginState = false;
                  indexScreen = 0;
                   // ignore: use_build_context_synchronously
                   Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NavigationHomePage()));
                }, child: const Text('Log out', style:  TextStyle(
                        color: kRedColor,
                        fontSize: 15,
                      ),))
              ],
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

PreferredSizeWidget? appBarWidget(BuildContext context, bool backButton) {
  return PreferredSize(
    preferredSize: successLoginState.onLoginState
        ? Size.fromHeight(MediaQuery.of(context).size.height * 0.2)
        : Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
    child: AppBar(
        backgroundColor: kSecondaryColor,
        leading: backButton
            ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp))
            : Image(
            image: const AssetImage('assets/images/banner0.jpg'),
            height: MediaQuery.of(context).size.height * 0.06),
        flexibleSpace: CustomAppBar()),
  );
}
