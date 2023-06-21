import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_store/src/core/model/product.dart';

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
            style: const TextStyle(fontSize: 16, color: kRedColor),
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
            // log('$rating');
          },
        ),
        //memory product
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = '64GB';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedOption == '64GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    '64GB',
                    style: TextStyle(
                      color: selectedOption == '64GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = '128GB';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedOption == '128GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    '128GB',
                    style: TextStyle(
                      color: selectedOption == '128GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = '256GB';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedOption == '256GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    '256GB',
                    style: TextStyle(
                      color: selectedOption == '256GB' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        //color product
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedColor = 'Blue';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedColor == 'Blue' ? kBlueColor : kGreyColor,
                    ),
                  ),
                  child: Text(
                    'Blue',
                    style: TextStyle(
                      color: selectedColor == 'Blue' ? kBlueColor : kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedColor = 'Red';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedColor == 'Red' ? kRedColor : kGreyColor,
                    ),
                  ),
                  child: Text(
                    'Red',
                    style: TextStyle(
                      color: selectedColor == 'Red' ? kRedColor : kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 65,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedColor = 'Black';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: selectedColor == 'Black' ? kBlackColor : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Black',
                    style: TextStyle(
                      color: selectedColor == 'Black' ? kBlackColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
            //price product
           Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            '${widget.productDTO.price}',
            style:  const TextStyle(fontSize: 16, color: kRedColor,fontWeight: FontWeight.bold,fontFamily: "Times New Roman",),
          ),
        )
        
      ],
    );
  }
}
