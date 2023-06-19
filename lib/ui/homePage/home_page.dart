import 'package:flutter/material.dart';
import 'package:mobile_store/ui/category/screen/category_screen.dart';
import 'package:mobile_store/ui/homePage/screen/product_screen.dart';

import 'bottom_navigation.dart';
import 'carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50), child: Text('Hehe')),
        title: Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.max,
            children: [
              PopupMenuButton(
                onSelected: (value) => onSelected(context, value),
                offset: Offset(-20, 52),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Expanded(
          child: Column(children: [
            CarouselSliderBanner(),
            ProductScreen(),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: const BottomNavigation(),
      ),
    );
  }
}
