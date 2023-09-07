import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../detail_product/view_model/detail_product_view_model.dart';

class RatingProduct extends StatefulWidget {
  final ProductDTO productDTO;

  const RatingProduct({super.key, required this.productDTO});

  @override
  State<RatingProduct> createState() => _RatingProductState();
}

class _RatingProductState extends State<RatingProduct> {
  String selectedOption = '';
  String selectedColor = '';
  DetailProductViewModel detailProductViewModel = DetailProductViewModel();
  CartViewModel cartViewModel = CartViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          initialRating: widget.productDTO.star ?? 0.0,
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
                      // color: selectedColor == colorName
                      //     ? colorMap[colorName]
                      //     : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: selectedColor == colorName
                            ? kGreenColor
                            : kGreyColor,
                      ),
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
                if (successLoginState.isVerified) {
                  if (selectedOption != '' && selectedColor != '') {
                    int status = cartViewModel.addToCart(context, selectedOption,
                        selectedColor, widget.productDTO);
                    if(status == StatusAddToCart.successfully.index){
                      showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                              message: 'Add to cart successfully'));
                    }else{
                      showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                              message: 'Maximum number of product'));
                    }
                  } else {
                    showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                            message: 'Please choose memory or color option'));
                  }
                } else {
                  showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.error(
                          message: 'You are not login yet'));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kGreenColor,
              ),
              child: Text(
                AppLocalizations.of(context)!.addToCart.toUpperCase(),
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
