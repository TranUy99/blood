import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/api_outside/api_image.dart';
import 'package:mobile_store/src/core/model/product.dart';

class ImageProduct extends StatefulWidget {
  final ProductDTO productDTO;
  const ImageProduct({super.key, required this.productDTO});

  @override
  State<ImageProduct> createState() => _ImageProductState();
}

class _ImageProductState extends State<ImageProduct> {


  @override
  Widget build(BuildContext context) {
      final imagesList = widget.productDTO.imageDTOs!;
      // String logo = '${imagesList[index].name}';
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
              child: CachedNetworkImage(imageUrl: ApiImage().generateImageUrl('${item.name}'),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
            ),
          )
          .toList(),
    );
  }
}
