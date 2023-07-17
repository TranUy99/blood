import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../../home_page/bloc/product_bloc.dart';
import '../../home_page/view/product_screen.dart';
import '../../component/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductBloc productBloc = ProductBloc();
  List<String> brandName = [
    'Apple',
    'Samsung',
    'Oppo',
    'Xiaomi',
    'Vivo',
    'Realme',
    'Nokia',
    'Apple',
    'Samsung',
    'Oppo',
    'Xiaomi',
    'Vivo',
    'Realme',
    'Nokia',
    'Apple',
    'Samsung',
    'Oppo',
    'Xiaomi',
    'Vivo',
    'Realme',
    'Nokia'
  ];
  List<String> priceRange = ['Under 500 USD',
    '500 - 1000 USD',
    '1000 - 1500 USD',
    '1500 - 2000 USD',
    '2000 - 2500 USD',
    '2500 - 3000 USD'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.02
              ),
              child: Row(
                children: [
                  productFilter('Manufacturer', 0.35, manufacturerMenuItems),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  productFilter('Price', 0.25, priceMenuItems)
                ],
              ),
            ),
            ProductScreen(productBloc: productBloc),
          ],
        ),
      ),
    );
  }

  Widget productFilter(String title, double sizeWidth, Widget Function() menuItem) {
    return CustomPopupMenu(
      position: PreferredPosition.bottom,
      arrowColor: kWhiteColor,
      barrierColor: Colors.black45,
        menuBuilder: menuItem,
        pressType: PressType.singleClick,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * sizeWidth,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title),
              const Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
        )
    );
  }

  Widget manufacturerMenuItems() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,
      horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisCount: 4,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
        ),
        shrinkWrap: true,
        itemCount: brandName.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(brandName[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(brandName[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget priceMenuItems() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3/1,
          crossAxisCount: 3,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
        ),
        shrinkWrap: true,
        itemCount: priceRange.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(priceRange[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(priceRange[index]),
              ),
            ),
          );
        },
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
