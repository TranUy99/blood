import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_bloc.dart';
import 'package:mobile_store/src/features/home_page/screen/product_screen.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductBloc productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          backgroundColor: kSecondaryColor,
          leading: Image(
            image: const AssetImage('images/banner0.jpg'),
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          flexibleSpace: const CustomAppBar()
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(children: [

          const CarouselSliderBanner(),
          ProductScreen(productBloc: productBloc),
        ]),
      ),
    );
  }
}
