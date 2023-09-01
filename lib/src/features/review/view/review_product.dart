import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/review/widget/extended_review.dart';
import 'package:mobile_store/src/features/review/view_model/review_view_model.dart';
import 'package:mobile_store/src/features/review/widget/review_written.dart';

import '../../../../main.dart';
import '../../../core/model/review_dtos.dart';
import '../widget/edit_review.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  final ReviewViewModel _reviewViewModel = ReviewViewModel();
  ReviewResponse? reviewResponse;
  List<ReviewDTOs> reviewList = [];
  int page = 0;
  int limit = 4;
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getReviewData(page);
  }

  _getReviewData(int currentPage) async {
    reviewResponse = await _reviewViewModel.getReviewViewModel(
        widget.productId, currentPage, limit);
    reviewList = (reviewResponse?.contents)!;
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
            successLoginState.isVerified
                ? ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => ReviewWritten(productId: widget.productId),
                      );
                      setState(() {
                        reviewList = [];
                        page = 0;
                        _getReviewData(page);
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
    return FutureBuilder(
      future: _reviewViewModel.getReviewViewModel(widget.productId, page, limit),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: kDarkGreyColor))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: ListTile(
                        trailing: (reviewList[index].userName ==
                                    getUser.userDTO.fullName &&
                                successLoginState.isVerified)
                            ? IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => EditReview(
                                      reviewID: reviewList[index].reviewID!,
                                      rating: reviewList[index].rating!,
                                      comment: reviewList[index].comment!,
                                      productID: widget.productId,
                                    ),
                                  );
                                  setState(() {
                                    reviewList = [];
                                    page = 0;
                                    _getReviewData(page);
                                  });
                                },
                              )
                            : null,
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('${reviewList[index].userName}'),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating:
                                      (reviewList[index].rating)!.toDouble(),
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
                      ),
                    ),
                  );
                },
                itemCount: reviewList.length,
                shrinkWrap: true,
              ),
              (page == (snapshot.data?.totalPages)! - 1)
                  ? SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        Get.to(ExtendedReview(productId: widget.productId,));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.048,
                            width: MediaQuery.of(context).size.width * 0.24,
                            decoration: BoxDecoration(
                                border: Border.all(color: kGreenColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Text(
                              'See more',
                              style: TextStyle(color: kGreenColor),
                            )),
                          ),
                        ),
                      ),
                    ),
            ],
          );
        } else {
          return const Text('Not have any review');
        }
      },
    );
  }
}
