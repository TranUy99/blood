import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/features/search/view_model/search_view_model.dart';
import '../../detail_product/view/detail_product_screen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchViewModel searchViewModel = SearchViewModel();
  List<ProductDTO> products = [];
  TextEditingController textSearchController = TextEditingController();
  Future<List<ProductDTO>>? searchFuture;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Search Product"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Search...',
                    labelStyle: const TextStyle(
                        color: kGreenColor, fontSize: 16, fontWeight: FontWeight.bold),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: kGreenColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: kGreenColor))),
                controller: textSearchController,
                onChanged: (value) async {
                  setState(() {
                    textSearchController.value.text == value;
                    searchFuture = searchViewModel.searchProduct(value);
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<ProductDTO>>(
            future: searchFuture,
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
                  return buildUI(context);
                } else {
                  return const Text('No products available');
                }
              }
            },
          ),
        ]),
      ),
    );
  }

  Widget buildUI(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            // String logo = '${product.imageDTOs![0].name}';
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
                child: Container(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.25,
                      //   child: CachedNetworkImage(
                      //     imageUrl: ApiImage().generateImageUrl('$logo'),
                      //     height: 20,
                      //   ),
                      // ),
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
              ),
            );
          },
        ),
      ],
    );
  }
}

void navigateToHomePage(BuildContext context, int i) {}
