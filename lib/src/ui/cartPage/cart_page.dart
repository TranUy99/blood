import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/homePage/screen/bottom_navigation.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();

  _CartPageState() {}
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ], title: Text('Cart Page ')),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 175, 221, 230),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigation(),
      ),
    );
  }
}
