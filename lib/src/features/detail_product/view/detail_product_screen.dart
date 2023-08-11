import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/detail_product/view_model/detail_product_view_model.dart';
import 'package:mobile_store/src/features/detail_product/widget/configuration_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/image_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/product_information.dart';
import 'package:mobile_store/src/features/detail_product/widget/rating_product.dart';
import 'package:mobile_store/src/features/detail_product/widget/review_product.dart';

import '../../../core/model/review_dtos.dart';
import '../../../core/remote/response/review_response/review_response.dart';
import '../view_model/review_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final int idProduct;

  const ProductDetailScreen({
    Key? key,
    required this.idProduct,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

List<ReviewDTOs> reviewList = [];
int currentPageReview = 0;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  DetailProductViewModel detailProductViewModel = DetailProductViewModel();

  late ProductDTO product;

  ReviewResponse? reviewResponse;
  final ReviewViewModel _reviewViewModel = ReviewViewModel();
  final ScrollController _scrollController = ScrollController();
  int length = 0;

  int no = 0;
  int limit = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      reviewList = [];
      currentPageReview = 0;
    });
    print(widget.idProduct);
    print('$currentPageReview - ${reviewResponse?.totalPages}');
    _getReviewData(widget.idProduct, currentPageReview);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  Future<void> fetch() async {
    if (currentPageReview < (reviewResponse!.totalPages!) &&
        (reviewResponse?.totalPages)! > 1) {
      try {
        setState(() {
          currentPageReview++;
          _getReviewData(widget.idProduct, currentPageReview);
        });
      } catch (e) {
        print(e);
      }
    }
    print('$currentPageReview - ${reviewResponse?.totalPages}');
  }

  _getReviewData(int categoryId, int page) async {
    reviewResponse = await _reviewViewModel.getReviewViewModel(
        widget.idProduct, page, limit);
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
    return FutureBuilder<ProductDTO>(
      future: detailProductViewModel.getDetailProduct(widget.idProduct),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            reviewList.length < 4) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            product = snapshot.data!;
            return buildUI(context);
          } else {
            return const Text('No products available');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageProduct(productDTO: product),
              RatingProduct(productDTO: product),
              const ConfigurationProduct(),
              ProductInformation(productDTO: product),
              ReviewProduct(
                productId: widget.idProduct,
                no: no,
                limit: limit,
              ),
              // const AnotherProduct(),
            ],
          )),
    );
  }
}
