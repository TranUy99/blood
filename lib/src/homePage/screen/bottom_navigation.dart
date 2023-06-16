import 'package:flutter/material.dart';
import 'package:mobile_store/src/cartPage/cart_page.dart';
import '../../constant/colors/theme.dart';
import 'home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    const homePage = HomePage();
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => setState(() {}),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              selectedIcon: Icon(Icons.shopping_cart)),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Me',
              selectedIcon: Icon(Icons.account_circle))
        ],
      ),
    );
    throw UnimplementedError();
  }
}

setState(Null Function() param0) {}
