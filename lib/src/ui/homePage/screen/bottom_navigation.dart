import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => setState(() {
          index = value;
        }),
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: Icon(Icons.home)),
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
  }
}
