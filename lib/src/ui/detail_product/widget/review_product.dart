import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/ui/detail_product/widget/more_product_information.dart';

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
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: kGreyColor, width: 0.8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.reviewOfCustomerBoughtTheProduct,
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
            const Text("Messi",
                style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left),
            const Text("màu tím ok nha, chưa thấy lỗi lầm hay bong tróc gì",
                style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left),
            const Text("Uy",
                style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left),
            const Text("Giá cạnh tranh nv quá là OK",
                style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left),
           const  Center(child:  MoreProductInformation()),
          ],
        ),
      ),
    );
  }
}
