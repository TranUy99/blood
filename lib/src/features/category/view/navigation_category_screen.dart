import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';
import 'package:mobile_store/src/features/category/view/category_screen.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/view/not_login.dart';
import 'package:mobile_store/src/features/profile/view/profile_page.dart';

import '../../../constant/color/color.dart';

class NavigationCategoryScreen extends StatefulWidget {
  const NavigationCategoryScreen({Key? key, required this.categoryIndex}) : super(key: key);
  final int categoryIndex;

  @override
  State<NavigationCategoryScreen> createState() => _NavigationCategoryScreenState();
}

int indexScreenCategory = 0;

class _NavigationCategoryScreenState extends State<NavigationCategoryScreen> {
  List appScreen = [];

  List navigationCategoryLoginScreen(int categoryID) {
    return appScreen = [
      CategoryScreen(categoryID: categoryID),
      const CartPage(),
      const ProfilePage()
    ];
  }

  List navigationCategoryLogoutScreen(int categoryID) {
    return appScreen = [
      CategoryScreen(categoryID: categoryID),
      const NotLogin(),
      const NotLogin()
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: successLoginState.onLoginState
          ? navigationCategoryLoginScreen(widget.categoryIndex)[indexScreenCategory]
          : navigationCategoryLogoutScreen(widget.categoryIndex)[indexScreenCategory],
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * 0.07,
        onDestinationSelected: (value) => setState(() {
          indexScreenCategory = value;
        }),
        indicatorColor: const Color.fromARGB(100, 233, 233, 233),
        selectedIndex: indexScreenCategory,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.category_outlined, size: 35),
            label: 'Home',
            selectedIcon: Icon(
              Icons.category,
              size: 35,
              color: kGreyColor,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined, size: 35),
            label: 'Cart',
            selectedIcon: Icon(
              Icons.shopping_cart,
              size: 35,
              color: kGreyColor,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined, size: 35),
            label: 'Me',
            selectedIcon: Icon(
              Icons.account_circle,
              size: 35,
              color: kGreyColor,
            ),
          )
        ],
      ),
    );
  }
}
