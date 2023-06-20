
import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NameProduct extends StatefulWidget {
  const NameProduct({super.key});

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
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'IPhone 14 Pro Max',
            style: TextStyle(fontSize: 16, color: kRedColor),
          ),
        ),
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
        const SizedBox(height: 5,),
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
                      color: selectedOption == 'Blue' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Blue',
                    style: TextStyle(
                      color: selectedOption == 'Blue' ? Colors.blue : Colors.grey,
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
                      color: selectedOption == 'Red' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Red',
                    style: TextStyle(
                      color: selectedOption == 'Red' ? Colors.blue : Colors.grey,
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
                      color: selectedOption == 'Black' ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Black',
                    style: TextStyle(
                      color: selectedOption == 'Black' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
