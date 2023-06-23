import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/cartPage/cart_page.dart';
import 'package:mobile_store/src/ui/homePage/screen/home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/login.dart';
import 'package:mobile_store/src/ui/profilePage/screen/profile_page.dart';

import '../../../constant/colors/theme.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  int index = 0;
  List appScreens = [const HomePage(), LogInScreen(), LogInScreen()];

  List navigationLoginScreen() {
    return appScreens = [const HomePage(), const CartPage(), const ProfilePage()];
  }

  List navigationLogoutScreen(){
    return appScreens = [const HomePage(), LogInScreen(), LogInScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationLoginScreen()[index],
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * 0.07,
        onDestinationSelected: (value) => setState(() {
          index = value;
        }),
        indicatorColor: Color.fromARGB(100, 233, 233, 233),
        selectedIndex: index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined, size: 35),
              label: 'Home',
              selectedIcon: Icon(Icons.home, size: 35)),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined, size: 35),
              label: 'Cart',
              selectedIcon: Icon(Icons.shopping_cart, size: 35)),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined, size: 35),
              label: 'Me',
              selectedIcon: Icon(Icons.account_circle, size: 35))
        ],
      ),
    );
  }
}
