import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/order/view/order.dart';
import 'package:mobile_store/src/features/promotion/view/promotion.dart';
import 'package:mobile_store/src/features/profile/view/your_information.dart';

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
    const OrderView(),
    const Promotion()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, false),
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
            child: SingleChildScrollView(
              child: Column(              
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconOfInformation('assets/icon/your_information_icon.png',
                            'Your information', 0),
                        iconOfInformation('assets/icon/order_icon.png', 'Order', 1),
                        iconOfInformation(
                            'assets/icon/promotion_icon.png', 'Promotion', 2),
                      ],
                    ),
                  ),
                  const Divider(color: kWhiteGrey, thickness: 10),
                  profilePageList[screenIndex],
                ],
              ),
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
