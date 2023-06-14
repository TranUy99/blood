import 'package:flutter/material.dart';
import 'package:mobile_store/homePage/screen/product_screen.dart';

import 'bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.cyan,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ProductScreen()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height *0.1,
        child: BottomNavigation(),
      ),
    );
  }
}
