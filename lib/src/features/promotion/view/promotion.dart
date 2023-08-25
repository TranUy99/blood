import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/model/promotion.dart';
import 'package:mobile_store/src/core/remote/response/promotion_response/promotion_response.dart';
import 'package:mobile_store/src/features/profile/widget/hexagon_discount.dart';
import 'package:mobile_store/src/features/promotion/view_model/promotion_view_model.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  PromotionViewModel promotionViewModel = PromotionViewModel();
  List<PromotionDTO> promotionList = [];
  PromotionResponse? promotionResponse;
  int currentPage = 0;
  int limit = 8;
  bool isLoading = false;
  final formatPrice = NumberFormat("#,###.###", "en_US");
  @override
  void initState() {
    _loadData(currentPage);
    super.initState();
  }

  Future<void> _loadData(int page) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      promotionResponse = await promotionViewModel.getPromotion(page, limit);
      setState(() {
        promotionList.addAll(promotionResponse?.contents ?? []);
        currentPage++;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (!isLoading &&
            scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
          _loadData(currentPage);
          return true;
        }
        return false;
      },
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: promotionList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < promotionList.length) {
                final promotion = promotionList[index];

                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
                  child: ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HexagonPage(
                          height: MediaQuery.of(context).size.height * 0.07,
                          discount: promotion.discountDTO,
                        ),
                      ],
                    ),
                    title: Text(
                      '${promotion.discountDTO}% discount for orders under ${formatPrice.format(promotion.totalPurchaseDTO)}\ VND, for customers who bought ${formatPrice.format(promotion.maxGetDTO)}\VND ',
                    ),
                  ),
                );
              } else if (index == promotionList.length && isLoading) {
                // Render loading indicator
                return const SizedBox();
              } else {
                // Reached the end of the list
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
