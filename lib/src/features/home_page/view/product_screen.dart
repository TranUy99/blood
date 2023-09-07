import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/api_outside/api_image.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/detail_product/view/detail_product_screen.dart';
import 'package:mobile_store/src/features/home_page/bloc/product_bloc.dart';
import 'package:mobile_store/src/features/home_page/view_model/product_viewmodel.dart';

class ProductScreen extends StatefulWidget {
  final ProductBloc productBloc;

  const ProductScreen({Key? key, required this.productBloc}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductDTO> products = [];
  final ProductViewModel _productViewModel = ProductViewModel();

  @override
  void dispose() {
    widget.productBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductDTO>>(
      future: _productViewModel.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            products = snapshot.data!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return Text(AppLocalizations.of(context)!.noProductsAvailable);
          }
        }
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.aspectRatio * 1.3
                : MediaQuery.of(context).size.aspectRatio * 0.7,
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            String logo = '${product.imageDTOs![0].name}';

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
                    builder: (context) => ProductDetailScreen(idProduct: product.id!),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: CachedNetworkImage(
                        imageUrl: ApiImage().generateImageUrl('$logo'),
                        height: 20,
                      ),
                    ),
                    Column(
                      children: [
                        Text('${product.name}',
                            style: const TextStyle(
                                fontSize: 20, color: kRedColor, fontFamily: 'sans-serif')),
                        Text(
                            '${NumberFormat('#,###.###').format(product.price).replaceAll(',', '.')} VND',
                            style: const TextStyle(
                                fontSize: 20, color: kGreenColor, fontFamily: 'sans-serif')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
