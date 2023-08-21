import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';
import 'package:mobile_store/src/features/detail_product/view_model/review_view_model.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/review/view/edit_review.dart';
import 'package:mobile_store/src/features/review/view/review_written.dart';

import '../../../../main.dart';
import '../../detail_product/view/detail_product_screen.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({
    super.key,
    required this.productId,
    required this.no,
    required this.limit,
  });

  final int productId;
  final int no;
  final int limit;

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  final ReviewViewModel _reviewViewModel = ReviewViewModel();
  ReviewResponse? reviewResponse;

  _getReviewData(int categoryId, int page) async {
    reviewResponse = await _reviewViewModel.getReviewViewModel(categoryId, page, widget.limit);
    try {
      setState(() {
        reviewList += reviewResponse?.contents ?? [];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(color: kGreyColor, width: 0.8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.reviewOfCustomerBoughtTheProduct.toUpperCase(),
                style: const TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            reviewListview(),
            successLoginState.onLoginState
                ? ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => ReviewWritten(productId: widget.productId),
                      );
                      setState(() {
                        reviewList = [];
                        currentPageReview = 0;
                        _getReviewData(widget.productId, widget.no);
                      });
                    },
                    child: const Text('Viết đánh giá'))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget reviewListview() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          trailing: (reviewList[index].userID == getUser.idUser && successLoginState.onLoginState)
              ? IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => EditReview(
                          reviewID: reviewList[index].reviewID!,
                          rating: reviewList[index].rating!,
                          comment: reviewList[index].comment!),
                    );
                    setState(() {
                      reviewList = [];
                      currentPageReview = 0;
                      _getReviewData(widget.productId, widget.no);
                    });
                  },
                )
              : null,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${reviewList[index].userID}'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: reviewList[index].rating!.toDouble(),
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('${reviewList[index].comment}'),
                ],
              )
            ],
          ),
        );
      },
      itemCount: reviewList.length,
      shrinkWrap: true,
    );
  }
}
