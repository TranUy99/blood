import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/homePage/screen/product_screen.dart';

import 'bottom_navigation.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageBanner = [
    const Image(image: AssetImage('images/banner0.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/banner1.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/banner2.gif'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/banner3.webp'), fit: BoxFit.fill)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(children: [
            Container(
              child: CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      // margin: EdgeInsets.only(left: 12, right: 12),
                      child: imageBanner[index],
                      // width: MediaQuery.of(context).size.width * 0.9,
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 24 / 10,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                  )),
            ),
            const ProductScreen(),
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
