import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/product_screen.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_appbar.dart';
import 'bottom_navigation.dart';
import 'carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

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
      body: const SingleChildScrollView(
        child: Column(children: [
          CarouselSliderBanner(),
          ProductScreen(),
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: const BottomNavigation(),
      ),
    );
  }
}
