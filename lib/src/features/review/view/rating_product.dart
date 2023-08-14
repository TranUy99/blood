import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/model/product_detail_cart.dart';

class RatingProduct extends StatefulWidget {
  final ProductDTO productDTO;

  const RatingProduct({super.key, required this.productDTO});

  @override
  State<RatingProduct> createState() => _RatingProductState();
}

class _RatingProductState extends State<RatingProduct> {
  String selectedOption = '';
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //name product
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '${widget.productDTO.name}',
            style: const TextStyle(
                fontSize: 16, color: kBlackColor, fontWeight: FontWeight.bold),
          ),
        ),

        //rating product
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          // itemPadding: const EdgeInsets.only(left:5),
          itemBuilder: (context, _) => Transform.scale(
            scale: 0.5,
            child: const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          onRatingUpdate: (rating) {},
        ),

        //memory product
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productDTO.memoryDTOs?.length,
            itemBuilder: (context, index) {
              final memoryOption = widget.productDTO.memoryDTOs?[index];
              final memoryName = memoryOption!.name;

              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = memoryName;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: selectedOption == memoryName
                            ? kGreenColor
                            : kGreyColor,
                      ),
                    ),
                    child: Text(
                      memoryName!,
                      style: TextStyle(
                        color: selectedOption == memoryName
                            ? kGreenColor
                            : kGreyColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //color product
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productDTO.colorDTOs?.length,
            itemBuilder: (context, index) {
              final colorOption = widget.productDTO.colorDTOs?[index];
              final colorName = colorOption!.name;

              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedColor = colorName;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: selectedColor == colorName
                          ? colorMap[colorName]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(),
                    ),
                    child: Text(
                      colorName!,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),
        //price product
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            '${NumberFormat('#,###.###').format(widget.productDTO.price).replaceAll(',', '.')} VND',
            style: const TextStyle(
              fontSize: 16,
              color: kRedColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                int? flag;
                String? memory;
                String? color;

                if (selectedOption != '' && selectedColor != '') {
                  for (int i = 0; i < getUser.cartBox!.length; i++) {
                    ProductDetailCart product = getUser.cartBox?.getAt(i);
                    if (widget.productDTO.id == product.productID &&
                        selectedOption == product.memory &&
                        selectedColor == product.color) {
                      flag = i;
                      memory = selectedOption;
                      color = selectedColor;
                    }
                  }
                  if (flag == null && memory == null && color == null) {
                    getUser.cartBox?.add(ProductDetailCart(
                        productID: widget.productDTO.id ?? 0,
                        productQuantity: 1,
                        memory: selectedOption,
                        color: selectedColor));
                  } else {
                    ProductDetailCart product =
                        getUser.cartBox?.getAt(flag ?? 0);
                    getUser.cartBox?.putAt(
                        flag ?? 0,
                        ProductDetailCart(
                            productID: widget.productDTO.id ?? 0,
                            productQuantity: product.productQuantity + 1,
                            memory: product.memory,
                            color: product.color));
                  }
                  showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                          message: 'Add to cart successfully'));
                } else {
                  showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                          message: 'Please choose memory or color option'));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kGreenColor,
              ),
              child: Text(
                AppLocalizations.of(context)!.buyNow.toUpperCase(),
                style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
