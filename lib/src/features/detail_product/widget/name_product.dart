import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:intl/intl.dart';

class NameProduct extends StatefulWidget {
  final ProductDTO productDTO;
  const NameProduct({super.key, required this.productDTO});

  @override
  State<NameProduct> createState() => _NameProductState();
}

class _NameProductState extends State<NameProduct> {
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
            style: const TextStyle(fontSize: 16, color: kBlackColor, fontWeight: FontWeight.bold),
          ),
        ),

        //rating product
        RatingBar.builder(
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
          onRatingUpdate: (rating) {
          
          },
          
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
                        color: selectedOption == memoryName ? kGreenColor : kGreyColor,
                      ),
                    ),
                    child: Text(
                      memoryName!,
                      style: TextStyle(
                        color: selectedOption == memoryName ? kGreenColor : kGreyColor,
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
                      color: selectedColor == colorName ? colorMap[colorName] : Colors.white,
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
        )
      ],
    );
  }
}
