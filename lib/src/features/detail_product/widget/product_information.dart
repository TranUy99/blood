import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/widget/more_product_information.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductInformation extends StatefulWidget {
  final ProductDTO productDTO;
  const ProductInformation({super.key, required this.productDTO});

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
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(color: kGreyColor, width: 0.8))),
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
            Html(
              data: widget.productDTO.productTechDTOs![0].info ?? '',
              style: {
                'h1': Style(color: Colors.red),
                'p': Style(color: Colors.black87, fontSize: FontSize.medium),
                'ul': Style(
                  margin: Margins.symmetric(vertical: 10.0, horizontal: 10.0)
                )
              },
            ),
             MoreProductInformation(productDTO: widget.productDTO,),
          ],
        ),
      ),
    );
  }
}
