import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/profile_page/screen/order.dart';
import 'package:mobile_store/src/features/profile_page/screen/promotion.dart';
import 'package:mobile_store/src/features/profile_page/screen/your_information.dart';

import '../../../constant/color/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int screenIndex = 0;

  List<StatefulWidget> profilePageList = [
    const YourInformation(),
    const Order(),
    const Promotion()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
            backgroundColor: kSecondaryColor,
            leading: Image(
              image: const AssetImage('images/banner0.jpg'),
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            flexibleSpace: const CustomAppBar()),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: kWhiteGrey),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      iconOfInformation('images/your_information_icon.png',
                          'Your information', 0),
                      iconOfInformation('images/order_icon.png', 'Order', 1),
                      iconOfInformation(
                          'images/promotion_icon.png', 'Promotion', 2),
                    ],
                  ),
                ),
                const Divider(color: kWhiteGrey, thickness: 10),
                profilePageList[screenIndex],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconOfInformation(String imageSrc, String name, int screen) {
    return InkWell(
      onTap: () {
        setState(() {
          screenIndex = screen;
        });
      },
      child: Column(
        children: [
          Image.asset(imageSrc,
              height: MediaQuery.of(context).size.height * 0.05),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(name),
        ],
      ),
    );
  }

}
