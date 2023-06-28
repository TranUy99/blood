import 'package:flutter/material.dart';

import '../../../constant/colors/theme.dart';
import '../../homePage/widget/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryType;
  const CategoryScreen({Key? key, required this.categoryType}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          backgroundColor: kSecondaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.categoryType),
          flexibleSpace: const CustomAppBar(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of MenuItemButton items
              itemBuilder: (BuildContext context, int index) {
                return SubmenuButton(
                  menuChildren: <Widget>[
                    Wrap(
                      spacing: 8.0,
                      children: List<Widget>.generate(4, (int i) {
                        int itemIndex = index * 4 + i;
                        if (itemIndex >= 10) {
                          return SizedBox.shrink(); // Limit the number of buttons
                        }
                        List<String> labels = ['iPhone', 'Samsung', 'Nokia', 'Vivo', 'Oppo', 'Xiaomi', 'Realme', 'Google', 'Microsoft', 'Other'];
                        return MenuItemButton(
                          onPressed: () {
                            String message = labels[itemIndex];
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          },
                          child: MenuAcceleratorLabel(getMenuItemLabel(itemIndex)),
                        );
                      }),
                    ),
                  ],
                  child: Row(
                    children: [
                      MenuAcceleratorLabel('Manufacturer'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getMenuItemLabel(int itemIndex) {
    // Define your logic to determine the label for each MenuItemButton based on the itemIndex
    if (itemIndex == 0) {
      return 'Item 1';
    } else if (itemIndex == 1) {
      return 'Item 2';
    } else if (itemIndex == 2) {
      return 'Item 3';
    }
    return '';
  }
}
