import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/api_outside/api_image.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/product.dart';
import 'package:mobile_store/src/core/remote/response/search_response/search_response.dart';
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
  SearchResponse? searchResponse;
  final ScrollController _scrollController = ScrollController();
  int currentPage = 0;
  int limit = 4;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      await _loadData(textSearchController.text, currentPage);
    }
  }

  Future<void> _loadData(String search, int page) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      searchResponse = await searchViewModel.searchProduct(search, page, limit);

      setState(() {
        products.addAll(searchResponse?.contents ?? []);
        currentPage++;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Product"),
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Search...',
                      labelStyle: const TextStyle(
                        color: kGreenColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: kGreenColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: kGreenColor),
                      ),
                    ),
                    controller: textSearchController,
                    onChanged: (value) async {
                      setState(() {
                        currentPage = 0;
                        products = [];
                      });
                      await _loadData(value, currentPage);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BuildUI(context)
            ],
          ),
        ),
      ),
    );
  }


  Widget BuildUI(content) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length + 1, // Add 1 for the loading indicator
          itemBuilder: (BuildContext context, int index) {
            if (index < products.length) {
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
                        height: MediaQuery.of(context).size.height * 0.23,
                        child: CachedNetworkImage(
                          imageUrl: ApiImage().generateImageUrl(logo),
                          height: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${product.name}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: kRedColor,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                          Text(
                            '${product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: kGreenColor,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (index == products.length && isLoading) {
              // Render loading indicator
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              );
            } else {
              // Reached the end of the list
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
