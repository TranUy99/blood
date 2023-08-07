
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';

class MoreProductInformation extends StatelessWidget {
  final ProductDTO productDTO;
  const MoreProductInformation({super.key, required this.productDTO});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                '${productDTO.name}',
                style: const TextStyle(
                  color: kGreenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.close,
                    style: const TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productDTO.productTechDTOs!.length,
                  itemBuilder: (BuildContext context, int index) {

                    return Html(
                      data: productDTO.productTechDTOs![index].info!,
                      style: {
                        'h1': Style(color: Colors.red),
                        'p': Style(color: Colors.black87, fontSize: FontSize.medium),
                        'ul': Style(margin: Margins.symmetric(vertical: 10.0, horizontal: 10.0))
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kGreenColor, width: 1.0),
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        AppLocalizations.of(context)!.seeMore,
        style: const TextStyle(
          color: kGreenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
