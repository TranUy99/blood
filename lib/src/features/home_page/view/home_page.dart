import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/home_page/view/product_screen.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, false),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          // ProductScreen(productBloc: productBloc);
        },
        child: const SingleChildScrollView(
          child:  Column(children: [
            CarouselSliderBanner(),
            Menu(),
          ]),
        ),
      ),
    );
  }
}
