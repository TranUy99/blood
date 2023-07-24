import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constant/color/color.dart';
import '../../component/custom_app_bar.dart';
import 'package:mobile_store/src/features/checkout/widget/delivery_address.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

int screenIndex = 0;

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Image(
                image: const AssetImage('assets/icon/delivery_truck_icon.png'),
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kGreyColor,
                  width: 1.0,
                ),
                //borderRadius: BorderRadius.circular(3),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeliveryAddress(
                    name: 'Tran Ky Anh',
                    phone: '0583841958',
                    address:
                        '273 Ly Thuong Kiet, 6 ward, district 8, Ho Chi Minh city',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kGreyColor,
                  width: 1.0,
                ),
                //borderRadius: BorderRadius.circular(3),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.list_outlined,
                        color: kGreenColor,
                      ),
                      Text(
                        " Product Details",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100, // Đặt kích thước bằng chiều rộng màn hình
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 150,
                              aspectRatio: 1.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              initialPage: 0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.vertical,
                            ),
                            items: [
                              Image.asset(
                                'assets/images/anh1.jpg',
                                height: 150,
                                width: 80,
                              ),
                              Image.asset(
                                 'assets/images/anh1.jpg',
                                height: 150,
                                width: 80,
                              ),
                              Image.asset(
                               'assets/images/anh1.jpg',
                                height: 150,
                                width: 80,
                              ),
                              // Thêm các ảnh khác tại đây
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Samsung Galaxy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 70),
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kYellow,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Blue, 128Gb",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kGreyColor,
                                  ),
                                ),
                                Text(
                                  "x1",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "699 USD",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: kGreenColor,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "iPhone X",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Black, 64Gb",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kGreyColor,
                                  ),
                                ),
                                Text(
                                  "x1",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "1025 USD",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: kGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.total}:',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 72),
                            child: Text(
                              "1724 USD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: kRedColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the Pay button press
                        },
                        child: Text(
                          AppLocalizations.of(context)!.paid,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kGreyColor,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kGreyColor,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.wallet,
                        color: Colors.pink,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.paymentMethod,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Payment with a bank account",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kGreyColor,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.orderNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "48998",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.orderTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "30-06-2023 13:30",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.paymentTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "30-06-2023 13:30",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.estimatedPickuptime,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "03-07-2023 16:00",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the Buy again button press
                      },
                      child: Text(
                        AppLocalizations.of(context)!.buyAgain,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kGreenColor,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
