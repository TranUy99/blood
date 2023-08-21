import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/categories_dto.dart';
import 'package:mobile_store/src/features/category/view/category_screen.dart';
import 'package:mobile_store/src/features/category/view_model/category_view_model.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  GetCategoryViewModel getCategoryViewModel = GetCategoryViewModel();
  List<CategoriesDTO> categoryList = [];
  int no = 0;
  int limit = 10;

  _getData() async {
    categoryList =
        await getCategoryViewModel.getCategoryViewModel(no, limit) ?? [];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // onOpened: () => _getData(),
      onSelected: (value) => onSelected(context, value),
      offset: const Offset(-20, 52),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      itemBuilder: (context) => menuItems(),
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
  }

  List<PopupMenuEntry<int>> menuItems() {
    List<PopupMenuEntry<int>> menuList = [];

    for (final items in categoryList) {
      menuList.add(PopupMenuItem(
          value: items.id,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(items.name ?? ''),
          )));
    }

    return menuList;
  }
}
