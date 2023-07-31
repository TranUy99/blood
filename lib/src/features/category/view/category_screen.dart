import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/features/category/view_model/category_view_model.dart';

import '../../../constant/api_outside/api_image.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/product_filter.dart';
import '../../component/custom_app_bar.dart';
import '../../detail_product/view/detail_product_screen.dart';
import '../../home_page/bloc/product_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.categoryID}) : super(key: key);

  final int categoryID;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductBloc productBloc = ProductBloc();
  CategoryViewModel categoryViewModel = CategoryViewModel();
  final ScrollController _scrollController = ScrollController();
  final CustomPopupMenuController _manufacturerCustomPopupMenuController =
      CustomPopupMenuController();
  final CustomPopupMenuController _priceCustomPopupMenuController =
      CustomPopupMenuController();
  CategoryFilterResponse? categoryFilterResponse;
  List<String> brandName = ['Apple', 'Xiaomi', 'Samsung'];
  List<String> priceRange = [
    'Under 500 USD',
    '500 - 1000 USD',
    '1000 - 1500 USD',
    '1500 - 2000 USD',
    '2000 - 2500 USD',
    '2500 - 3000 USD'
  ];
  List<ProductFilter> products = [];
  List<ProductFilter> productFilterList = [];
  int currentPage = 0;
  int limit = 4;
  String? manufacturerName;
  int? manufacturerIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData(widget.categoryID, currentPage);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  Future<void> fetch() async {
    print('End gridview');
    if (currentPage < (categoryFilterResponse!.totalPages! - 1)) {
      try {
        setState(() {
          currentPage++;
          _getData(widget.categoryID, currentPage);
        });
      } catch (e) {
        print(e);
      }
      print('next page $currentPage');
    }
  }

  _getData(int categoryId, int page) async {
    print('categoryId: $categoryId');
    categoryFilterResponse = await categoryViewModel.categoryFilterViewModel(
        widget.categoryID, page, limit);
    try {
      print('view ${categoryFilterResponse!.contents?[0].categoriesDTO?.name}');
      setState(() {
        products += (categoryFilterResponse?.contents)!;
      });
    } catch (e) {
      print('view: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              children: [
                productFilter(
                    manufacturerName ?? 'Manufacturer',
                    0.35,
                    manufacturerMenuItems,
                    _manufacturerCustomPopupMenuController),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                productFilter('Price', 0.25, priceMenuItems,
                    _priceCustomPopupMenuController)
              ],
            ),
          ),
          FutureBuilder(
            future: categoryViewModel.categoryFilterViewModel(
                widget.categoryID, 0, 10),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.hasData) {
                  return productFilterDisplay();
                } else {
                  return const Text('No product available');
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget productFilterDisplay() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.4,
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        controller: _scrollController,
        itemCount: products.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
                    builder: (context) =>
                        ProductDetailScreen(idProduct: product.id!),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: CachedNetworkImage(
                        imageUrl: ApiImage().generateImageUrl(logo),
                        height: 20,
                      ),
                    ),
                    Column(
                      children: [
                        Text('${product.name}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: kRedColor,
                                fontFamily: 'sans-serif')),
                        Text('${product.price}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: kGreenColor,
                                fontFamily: 'sans-serif')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (index == products.length &&
              currentPage < (categoryFilterResponse!.totalPages! - 1) &&
              index > 3) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget productFilter(
      String title,
      double sizeWidth,
      Widget Function() menuItem,
      CustomPopupMenuController customPopupMenuController) {
    return CustomPopupMenu(
        controller: customPopupMenuController,
        position: PreferredPosition.bottom,
        arrowColor: kWhiteColor,
        barrierColor: Colors.black45,
        menuBuilder: menuItem,
        pressType: PressType.singleClick,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * sizeWidth,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title),
              const Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
        ));
  }

  Widget manufacturerMenuItems() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisCount: 4,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
        ),
        shrinkWrap: true,
        itemCount: brandName.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (manufacturerIndex != index) {
                  manufacturerName = brandName[index];
                  manufacturerIndex = index;
                  products;
                } else {
                  manufacturerName = null;
                  manufacturerIndex = null;
                }
              });
              _manufacturerCustomPopupMenuController.hideMenu();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        (manufacturerName != null && manufacturerIndex == index)
                            ? Colors.redAccent
                            : kZambeziColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(brandName[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget priceMenuItems() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 1,
          crossAxisCount: 3,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
        ),
        shrinkWrap: true,
        itemCount: priceRange.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(priceRange[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(priceRange[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
