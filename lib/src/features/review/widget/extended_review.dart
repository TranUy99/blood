import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/review/view_model/review_view_model.dart';

import '../../../../main.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/review_dtos.dart';
import '../../../core/remote/response/review_response/review_response.dart';
import '../../login/bloc/login_bloc.dart';
import 'edit_review.dart';

class ExtendedReview extends StatefulWidget {
  const ExtendedReview({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  State<ExtendedReview> createState() => _ExtendedReviewState();
}

class _ExtendedReviewState extends State<ExtendedReview> {
  final ReviewViewModel _reviewViewModel = ReviewViewModel();
  ReviewResponse? reviewResponse;
  List<ReviewDTOs> reviewList = [];
  int page = 0;
  int limit = 9;
  bool flag = true;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getReviewData(page);
    _scrollController.addListener(() {
      if(_scrollController.position.maxScrollExtent == _scrollController.offset){
        _fetch();
      }
    });
  }

  _fetch() async {
    if (page < (reviewResponse?.totalPages)!) {
      setState(() {
        page++;
        isLoading = false;
      });
      _getReviewData(page);
    }
  }

  _getReviewData(int currentPage) async {
    reviewResponse = await _reviewViewModel.getReviewViewModel(
        widget.productId, currentPage, limit);
    reviewList += (reviewResponse?.contents)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: reviewListview(),
      ),
    );
  }

  Widget reviewListview() {
    return FutureBuilder(
      future: _reviewViewModel.getReviewViewModel(widget.productId, page, limit),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index < reviewList.length) {
                    return Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: kDarkGreyColor))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
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
                  } else {
                    return Center(
                      child: (page < (reviewResponse?.totalPages)! )
                          ? const CircularProgressIndicator()
                          : const Text('All review are shown'),
                    );

                  }
                 
                },
                itemCount: reviewList.length + 1,
                shrinkWrap: true,
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