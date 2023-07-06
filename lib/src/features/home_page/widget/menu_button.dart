

import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/category/screen/category_screen.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => onSelected(context, value),
      offset: const Offset(-20, 52),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: menuItems('Mobile', 'images/mobile_menu_item.png'),
        ),
        PopupMenuItem(
          value: 1,
          child: menuItems('Laptop', 'images/laptop_menu_item.png'),
        ),
        PopupMenuItem(
          value: 2,
          child: menuItems('Tablet', 'images/tablet_menu_item.png'),
        ),
        PopupMenuItem(
          value: 3,
          child: menuItems('PC', 'images/pc_menu_item.png'),
        ),
      ],
    );
  }

  navigatorPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        ));
  }

  onSelected(BuildContext context, int value) {
    navigatorPage(context);
  }

  Widget menuItems(String title, String src){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Row(
        children: [
          Image.asset(src, height: MediaQuery.of(context).size.height * 0.03),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Text(title),
        ],
      ),
    );
  }
}
