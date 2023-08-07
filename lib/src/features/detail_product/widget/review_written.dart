import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant/color/color.dart';

class ReviewWritten extends StatefulWidget {
  const ReviewWritten({Key? key}) : super(key: key);

  @override
  State<ReviewWritten> createState() => _ReviewWrittenState();
}

class _ReviewWrittenState extends State<ReviewWritten> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Write your review'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: kYellow,
              ),
              onRatingUpdate: (rating) {
              },
            ),
            TextFormField(
              maxLines: 5,
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: 'Review ...'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: () {

                }, child: Text('Save')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
