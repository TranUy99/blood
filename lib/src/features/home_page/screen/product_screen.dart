import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_bloc.dart';
import 'package:mobile_store/src/features/detail_product/view/product_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductScreen extends StatefulWidget {
  final ProductBloc productBloc;

  const ProductScreen({Key? key, required this.productBloc}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductDTO> products = [];
  @override
  void initState() {
    super.initState();
    widget.productBloc.fetchProducts();
  }

  @override
  void dispose() {
    widget.productBloc.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return StreamBuilder<List<ProductDTO>>(
    stream: widget.productBloc.productListStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        products = snapshot.data!;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {});
        });
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      return buildUI(context);
    },
  );
}

  Widget buildUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.news,
                style: const TextStyle(
                  fontSize: 20,
                  color: kRedColor,
                  fontFamily: 'sans-serif',
                ),
              ),
              const Image(
                image: AssetImage('assets/icon/fire_icon.png'),
                height: 20,
              ),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kZambeziColor,
                  width: 2.0,
                ),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(productDTO: product),
                  ),
                ),
                child: Container(
                  // decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Image(
                          image: AssetImage(product.image!),
                          height: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Text('${product.name}', style: const TextStyle(fontSize: 20, color: kRedColor, fontFamily: 'sans-serif')),
                          Text('${product.price}', style: const TextStyle(fontSize: 20, color: kGreenColor, fontFamily: 'sans-serif')),
                        ],
                      ),
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

