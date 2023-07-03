import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors/theme.dart';
import '../../homePage/widget/custom_app_bar.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(backgroundColor: kSecondaryColor, flexibleSpace: const CustomAppBar()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Image(
                image: const AssetImage('images/deliveries.png'),
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: kRedColor,
                      ),
                      Text(
                        "Delivery address",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text("Tran Ky Anh",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("0983269424",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: const Text("273 Ly Thuong Kiet 6 ward, district 8, Ho chi MinH city ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.credit_card,
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
                              autoPlayInterval: Duration(seconds: 2),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.vertical,
                            ),
                            items: [
                              Image.asset(
                                'images/iphone.png',
                                height: 150,
                                width: 80,
                              ),
                              Image.asset(
                                'images/huawei.png',
                                height: 150,
                                width: 80,
                              ),
                              Image.asset(
                                'images/iphone14.jpg',
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
                       const  Column(
                          children: [
                             Text(
                              "Samsung  Galaxy",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Blue, 128Gb",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                             Text(
                              "X1",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: const Text("273 Ly Thuong Kiet 6 ward, district 8, Ho chi MinH city ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
