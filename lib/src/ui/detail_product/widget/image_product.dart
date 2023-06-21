import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatefulWidget {
  const ImageProduct({super.key});

  @override
  State<ImageProduct> createState() => _ImageProductState();
}

class _ImageProductState extends State<ImageProduct> {
  final imagesList = [
    const Image(image: AssetImage('images/iphone-14-pro-max-tong-quan-1020x570.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/iphone-14-pro-max-up-3-new-1020x570.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/vi-vn-iphone-14-pro-max-up-5.jpg'), fit: BoxFit.fill),
    const Image(image: AssetImage('images/vi-vn-iphone-14-pro-max-up-6.jpg'), fit: BoxFit.fill)
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imagesList
          .map(
            (item) => Center(
              child: item,
            ),
          )
          .toList(),
    );
  }
}
