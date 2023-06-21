

import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/category/screen/category_screen.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    navigatorPage(String categoryType) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(categoryType: categoryType),
          ));
    }

    onSelected(BuildContext context, int value) {
      switch (value) {
        case 0:
          navigatorPage('Laptop');
          break;
        case 1:
          navigatorPage('PC');
          break;
        case 2:
          navigatorPage('Điện thoại');
          break;
        case 3:
          navigatorPage('Tai nghe');
          break;
      }
    }

    return PopupMenuButton(
      onSelected: (value) => onSelected(context, value),
      offset: const Offset(-20, 52),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Text('Laptop'),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text('PC'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Điện thoại'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Tai nghe'),
        ),
      ],
    );
  }
}
