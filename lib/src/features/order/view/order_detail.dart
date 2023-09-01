import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/model/order_detail.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/checkout/widget/delivery_address.dart';

import '../../../constant/api_outside/api_image.dart';
import '../../../constant/color/color.dart';
import '../../component/custom_app_bar.dart';
import '../view_model/order_view_model.dart';

class OrderDetail extends StatefulWidget {
  final int? idOrder;
  const OrderDetail({required this.idOrder, super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final OrderViewModel _orderViewModel = OrderViewModel();
  late OrderDetailDTO orderDetailDTO;
  final CartViewModel _cartViewModel = CartViewModel();
  bool isBuyAgain = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OrderDetailDTO?>(
      future: _orderViewModel.getOrderDetail(widget.idOrder!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            orderDetailDTO = snapshot.data!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return const Text('No order available');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    final orderProductDTOList = orderDetailDTO.orderProductDTOList;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DeliveryAddress(
                      name: '${orderDetailDTO.address!.nameReceiver}',
                      phone: '${orderDetailDTO.address!.phoneReceiver}',
                      address: '${orderDetailDTO.address!.location}',
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
                            width: 150,
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
                              items: orderProductDTOList!
                                  .map(
                                    (item) => Center(
                                      child: CachedNetworkImage(
                                        imageUrl: ApiImage().generateImageUrl('${item.image}'),
                                        height: MediaQuery.of(context).size.height * 0.6,
                                        width: MediaQuery.of(context).size.width * 0.8,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.17,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: SingleChildScrollView(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: orderProductDTOList
                                          .length, // số lượng sản phẩm trong giỏ hàng
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${orderProductDTOList[index].name}",
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${orderProductDTOList[index].color}, ${orderProductDTOList[index].memory}",
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      color: kGreyColor,
                                                    ),
                                                  ),
                                                 
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 72),
                              child: Text(
                                "${NumberFormat('#,###.###').format(orderDetailDTO.orderDTO!.total).replaceAll(',', '.')} VND",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: kRedColor,
                                ),
                              ),
                            ),
                          ],
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
                    Text(
                      "Payment with a ${orderDetailDTO.orderDTO!.paymentMethodDTO!.name} ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              isBuyAgain? buyAgainButton() : const SizedBox.shrink(),
            ],
          ),
        ));
  }

  Widget buyAgainButton(){
    final orderProductDTOList = orderDetailDTO.orderProductDTOList;
    return Container(
      child: Column(
        children: [
          //Buy again button
          InkWell(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                color: kGreenColor,
              ),
              child: const Center(
                  child: Text(
                'Buy again',
                style: TextStyle(fontSize: 20, color: kWhiteColor),
              )),
            ),
          ),
          //Cancel button
          InkWell(
            onTap: () {
              setState(() {
                isBuyAgain = false;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(
                color: kRedColor,
              ),
              child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, color: kWhiteColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
