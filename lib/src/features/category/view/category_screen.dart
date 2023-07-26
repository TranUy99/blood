import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/remote/response/product_filter_response/category_filter_response.dart';
import 'package:mobile_store/src/features/category/view_model/category_view_model.dart';

import '../../../constant/api_image/api_image.dart';
import '../../../constant/color/color.dart';
import '../../../core/model/product.dart';
import '../../component/custom_app_bar.dart';
import '../../detail_product/view/detail_product_screen.dart';
import '../../home_page/bloc/product_bloc.dart';
import '../../home_page/view/product_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.categoryID})
      : super(key: key);

  final int categoryID;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductBloc productBloc = ProductBloc();
  CategoryViewModel categoryViewModel = CategoryViewModel();
  List<String> brandName = [

  ];
  List<String> priceRange = [
    'Under 500 USD',
    '500 - 1000 USD',
    '1000 - 1500 USD',
    '1500 - 2000 USD',
    '2000 - 2500 USD',
    '2500 - 3000 USD'
  ];
  List<ProductDTO> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('categoryId: ${widget.categoryID}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                children: [
                  productFilter('Manufacturer', 0.35, manufacturerMenuItems),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  productFilter('Price', 0.25, priceMenuItems)
                ],
              ),
            ),
            // ProductScreen(productBloc: productBloc),
            ElevatedButton(
                onPressed: () async {
                  CategoryFilterResponse? categoryFilterResponse =
                      await categoryViewModel.categoryFilterViewModel(1, 0, 10);
                  try{
                    print(
                        '${categoryFilterResponse?.limit}');
                  }catch(e){
                    print(e);
                  }
                },
                child: Text('text')),
            // productFilterDisplay()
          ],
        ),
      ),
    );
  }

  Widget productFilterDisplay() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      shrinkWrap: true,
      itemCount: 3,
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
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: CachedNetworkImage(
                      imageUrl: ApiImage().generateImageUrl('$logo'),
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
          ),
        );
      },
    );
  }

  Widget productFilter(
      String title, double sizeWidth, Widget Function() menuItem) {
    return CustomPopupMenu(
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
              print(brandName[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
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
