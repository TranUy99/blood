import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/screen/product_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.news,
                style: const TextStyle(fontSize: 20, color: kRedColor, fontFamily: 'sans-serif'),
              ),
              const Image(
                image: AssetImage('images/fire.png'),
                height: 20,
              ),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kZambeziColor,
                    width: 2.0,
                  )),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailScreen(),
                    )),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: const Image(
                          image: AssetImage('images/iphone14.jpg'),
                          height: 20,
                        ),
                      ),
                     const Column(
                      children: [
                          Text('IPhone 14 Pro Max', style: TextStyle(fontSize: 20, color: kRedColor, fontFamily: 'sans-serif')),
                       Text('1099 USD', style: TextStyle(fontSize: 20, color: kGreenColor, fontFamily: 'sans-serif'))
                      ],
                     )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
