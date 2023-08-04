import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/category/view/category_screen.dart';
import 'package:mobile_store/src/features/category/view_model/category_view_model.dart';

import '../../../core/remote/response/category_response/category_items_response.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  GetCategoryViewModel getCategoryViewModel = GetCategoryViewModel();
  List<CategoryItemsResponse> categoryList = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onOpened: () {

      },
      onSelected: (value) => onSelected(context, value),
      offset: const Offset(-20, 52),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: menuItems('Mobile', 'assets/icon/mobile_menu_item_icon.png'),
        ),
        PopupMenuItem(
          value: 2,
          child: menuItems('Laptop', 'assets/icon/laptop_menu_item_icon.png'),
        ),
        PopupMenuItem(
          value: 3,
          child: menuItems('Tablet', 'assets/icon/tablet_menu_item.png'),
        ),
        PopupMenuItem(
          value: 0,
          child: menuItems('PC', 'assets/icon/pc_menu_item_icon.png'),
        ),
      ],
    );
  }

  navigatorPage(BuildContext context, int value) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryScreen(categoryID: value),
        ));
  }

  onSelected(BuildContext context, int value) async {
    navigatorPage(context, value);
    // await getCategoryViewModel.getCategoryViewModel(0, 10);
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
