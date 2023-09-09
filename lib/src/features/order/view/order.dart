import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/order.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';
import 'package:mobile_store/src/features/order/view/order_detail.dart';

import '../../../constant/api_outside/api_image.dart';
import '../view_model/order_view_model.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderState();
}

class _OrderState extends State<OrderView> {
  OrderViewModel orderViewModel = OrderViewModel();
  List<Order> orderList = [];
  OrderResponse? orderResponse;
  int currentPage = 0;
  int limit = 4;
  bool isLoading = false;

  @override
  void initState() {
    _loadData(currentPage);
    super.initState();
  }

  Future<void> _loadData(int page) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      orderResponse = await orderViewModel.getOrder(page, limit);
      setState(() {
        orderList.addAll(orderResponse?.contents ?? []);
        currentPage++;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (!isLoading &&
            scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
          _loadData(currentPage);
          return true;
        }
        return false;
      },
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < orderList.length) {
                final order = orderList[index];
                DateTime dateTime = DateTime.parse(order.receiveDate!);
                String formattedDate =
                    "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: kDarkGreyColor, width: 2.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: CachedNetworkImage(
                              imageUrl: ApiImage().generateImageUrl(order.productOrderDTO!.image!),
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: MediaQuery.of(context).size.width * 0.31)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: order.quantity != 0
                                    ? Text(
                                        "${order.productOrderDTO!.name} and ${order.quantity} another product ",
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        "${order.productOrderDTO!.name} product ",
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 90,
                                    child: Text(
                                      'Delivery date:',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 150,
                                    child: Text(
                                      'Order number: ',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${order.id}',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      '${NumberFormat('#,###.###').format(order.total).replaceAll(',', '.')} VND',
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: kGreenColor),
                                    ),
                                  ),
                                  Container(
                                    color: kGreenColor,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderDetail(
                                              idOrder: order.id,
                                              receiveDate: dateTime,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Detail',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (index == orderList.length && isLoading) {
                // Render loading indicator
                return const SizedBox();
              } else {
                // Reached the end of the list
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
