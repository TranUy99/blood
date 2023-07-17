import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/cart_page/screen/cart_page.dart';
import 'package:mobile_store/src/features/home_page/view/home_page.dart';
import 'package:mobile_store/src/features/login/bloc/login_state.dart';
import 'package:mobile_store/src/features/profile/screen/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/bloc/login_bloc.dart';
import '../../login/view/login.dart';
import '../../login/view/not_login.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

int indexScreen = 0;

class _NavigationHomePageState extends State<NavigationHomePage> {
  final LoginBloc loginBloc = LoginBloc();
  final RxLoginBloc rxLoginBloc = RxLoginBloc();
  String? email;
  int? id;
  String? token;

  List appScreens = [const HomePage(), const LogInScreen(), const LogInScreen()];

  List navigationLoginScreen() {
    return appScreens = [const HomePage(), const CartPage(), const ProfilePage()];
  }

  List navigationLogoutScreen() {
    return appScreens = [const HomePage(), const NotLogin(), const NotLogin()];
  }

  navi() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: successLoginState.onLoginState ? navigationLoginScreen()[indexScreen] : navigationLogoutScreen()[indexScreen],
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * 0.07,
        onDestinationSelected: (value) => setState(() {
          indexScreen = value;
        }),
        indicatorColor: const Color.fromARGB(100, 233, 233, 233),
        selectedIndex: indexScreen,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined, size: 35),
              label: 'Home',
              selectedIcon: Icon(
                Icons.home,
                size: 35,
                color: kGreyColor,
              )),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined, size: 35), label: 'Cart', selectedIcon: Icon(Icons.shopping_cart, size: 35, color: kGreyColor)),
          NavigationDestination(icon: Icon(Icons.account_circle_outlined, size: 35), label: 'Me', selectedIcon: Icon(Icons.account_circle, size: 35, color: kGreyColor))
        ],
      ),
    );
  }
}
