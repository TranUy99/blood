import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/features/detail_product/widget/more_product_information.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: kGreyColor, width: 0.8))),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              AppLocalizations.of(context)!.productInformation.toUpperCase(),
              style: const TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              " iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.",
              style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w500),
            ),
            const MoreProductInformation(),
          ],
        ),
      ),
    );
  }
}
