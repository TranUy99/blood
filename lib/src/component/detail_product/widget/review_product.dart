import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/component/detail_product/widget/more_product_information.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: kGreyColor, width: 0.8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!
                    .reviewOfCustomerBoughtTheProduct
                    .toUpperCase(),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Messi",
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
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
// log('$rating');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Màu tím ok nha, chưa thấy lỗi lầm hay bong tróc gì",
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Uy",
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
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
// log('$rating');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Giá cạnh tranh, nhân viên quá là ok.",
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const Center(child: MoreProductInformation()),
          ],
        ),
      ),
    );
  }
}
