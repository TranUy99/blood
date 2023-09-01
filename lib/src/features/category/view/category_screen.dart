import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/features/category/view_model/category_view_model.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';

import '../../../constant/api_outside/api_image.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/manufacturer_dto.dart';
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
  GetManufacturerViewModel getManufacturerViewModel =
      GetManufacturerViewModel();
  CategoryFilterResponse? categoryFilterResponse;
  CustomPopupMenuController manufacturerPopupMenuController =
      CustomPopupMenuController();
  CustomPopupMenuController pricePopupMenuController =
      CustomPopupMenuController();
  List<String> priceRange(BuildContext context) => [
    '${AppLocalizations.of(context)?.under} 5${AppLocalizations.of(context)?.m}',
    '5${AppLocalizations.of(context)?.m} - 10${AppLocalizations.of(context)?.m}',
    '10${AppLocalizations.of(context)?.m} - 20${AppLocalizations.of(context)?.m}',
    '20${AppLocalizations.of(context)?.m} - 30${AppLocalizations.of(context)?.m}',
    '${AppLocalizations.of(context)?.over} 30${AppLocalizations.of(context)?.m}'
  ];

  List<ProductFilter> products = [];
  int currentPage = 0;
  int no = 0;
  int limit = 4;
  int? lowerPrice;
  int? higherPrice;
  List<ManufacturerDTO> manufacturerList = [];
  String? manufacturerName;
  int? manufacturerId;
  int? priceFilterIndex;
  final textCurrency = NumberFormat("#,###.###", "en_US");
  bool isLoad = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataManufacturer();
    _getDataProduct(widget.categoryID, currentPage);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetch();
      }
    });
  }

  Future<void> fetch() async {
    if (currentPage < (categoryFilterResponse!.totalPages! - 1)) {
      try {
        setState(() {
          currentPage++;
          isLoad = false;
          _getDataProduct(widget.categoryID, currentPage);
        });
      } catch (e) {
        print(e);
      }
    }
  }

  _getDataProduct(int categoryId, int page) async {
    categoryFilterResponse = await categoryViewModel.categoryFilterViewModel(
        manufacturerId, widget.categoryID, lowerPrice, higherPrice, page, limit);
    products += await categoryFilterResponse?.contents ?? [];
    print(categoryFilterResponse?.contents?.length);
  }

  _getDataManufacturer() async {
    manufacturerList =
        await getManufacturerViewModel.getManufacturerViewModel(no, limit) ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currentPage = 0;
            products = [];
          });
          _getDataProduct(widget.categoryID, currentPage);
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                children: [
                  productFilterBar(manufacturerName ?? '${AppLocalizations.of(context)?.manufacturer}',
                      manufacturerMenuItems, manufacturerPopupMenuController),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  productFilterBar(
                      (priceFilterIndex == null)
                          ? '${AppLocalizations.of(context)?.priceRange}'
                          : priceRange(context)[priceFilterIndex!],

                      priceMenuItems,
                      pricePopupMenuController)
                ],
              ),
            ),
            FutureBuilder(
              future: categoryViewModel.categoryFilterViewModel(manufacturerId,
                  widget.categoryID, lowerPrice, higherPrice, currentPage, limit),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting && isLoad) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return productFilterGridViewDisplay();
                } else {
                  return const Text('Not have any product');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget productFilterGridViewDisplay() {
    return SizedBox(
      height: successLoginState.isVerified
          ? MediaQuery.of(context).size.height * 0.65
          : MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio:
                MediaQuery.of(context).devicePixelRatio * 0.25,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: products.length,
          shrinkWrap: true,
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
                        Text('${textCurrency.format(product.price)} đ',
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
          },
        ),
      ),
    );
  }

  Widget productFilterBar(
      String title,
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

          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Text(title,),
              ),
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
          crossAxisCount: 3,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
        ),
        shrinkWrap: true,
        itemCount: manufacturerList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (manufacturerName == manufacturerList[index].name) {
                setState(() {
                  manufacturerName = null;
                  manufacturerId = null;
                  currentPage = 0;
                  products = [];
                });
                _getDataProduct(widget.categoryID, currentPage);
              } else {
                setState(() {
                  manufacturerId = manufacturerList[index].id;
                  manufacturerName = manufacturerList[index].name;
                  currentPage = 0;
                  products = [];
                });
                _getDataProduct(widget.categoryID, currentPage);
              }
              manufacturerPopupMenuController.hideMenu();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: (manufacturerName != null &&
                            manufacturerName == manufacturerList[index].name)
                        ? Colors.red
                        : Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(manufacturerList[index].name ?? ''),
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
        itemCount: priceRange(context).length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (priceFilterIndex == index) {
                setState(() {
                  priceFilterIndex = null;
                  lowerPrice = null;
                  higherPrice = null;
                  currentPage = 0;
                  products = [];
                });
                _getDataProduct(widget.categoryID, currentPage);
              } else {
                priceFilterIndex = index;
                switch (priceFilterIndex) {
                  case 0:
                    {
                      lowerPrice = 0;
                      higherPrice = 5000000;
                    }
                    break;
                  case 1:
                    {
                      lowerPrice = 5000000;
                      higherPrice = 10000000;
                    }
                    break;
                  case 2:
                    {
                      lowerPrice = 10000000;
                      higherPrice = 20000000;
                    }
                    break;
                  case 3:
                    {
                      lowerPrice = 20000000;
                      higherPrice = 30000000;
                    }
                    break;
                  case 4:
                    {
                      lowerPrice = 30000000;
                      higherPrice = 1000000000;
                    }
                    break;
                  default:
                    {
                      lowerPrice = null;
                      higherPrice = null;
                    }
                    break;
                }

                currentPage = 0;
                products = [];
                setState(() {});
                _getDataProduct(widget.categoryID, currentPage);
              }
              print('$lowerPrice - $higherPrice - $priceFilterIndex');

              pricePopupMenuController.hideMenu();
            },
            child: Container(
              decoration: BoxDecoration(
                border: (priceFilterIndex == index)
                    ? Border.all(color: Colors.red)
                    : Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(priceRange(context)[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}