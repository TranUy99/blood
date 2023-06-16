// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:mobile_store/src/cartPage/cart_page.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/homePage/screen/product_screen.dart';

import '../../widget/primary_button.dart';
import 'bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var actionIcon;

  late TextField appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ], title: Text('Home Page')),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.cyan,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ProductScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigation(),
      ),
    );
  }

  void _onItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }
}

goToHomePage(BuildContext context) {
  print('object');
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ));
}
