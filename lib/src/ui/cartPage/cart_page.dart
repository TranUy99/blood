import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/colors/theme.dart';
import 'package:mobile_store/src/ui/homePage/widget/custom_app_bar.dart';
import '../checkoutPage/screen/checkout_screen.dart';
import '../checkoutPage/widget/address.dart';
import '../homePage/screen/navigation_home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedAddressIndex = 0;
  List<String> addresses = [
    'Tran Ky Anh | 0583841958,\n515 a2-07 Le Van Luong, Tan Phong ward, district 7, Ho Chi Minh city',
    'Tran Ky Anh | 0583841958\n273 Ly Thuong Kiet, 6 ward, district 8, Ho Chi Minh city',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
            backgroundColor: kSecondaryColor,
            leading: Image(
              image: const AssetImage('images/banner0.jpg'),
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            flexibleSpace: const CustomAppBar()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      //Xử lý xóa tất cả sản phẩm
                    },
                    icon: Icon(Icons.clear_outlined),
                    label: Text(
                      AppLocalizations.of(context)!.clearCart,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kRedColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // số lượng sản phẩm trong giỏ hàng
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://i.pinimg.com/564x/a5/50/b2/a550b2c7ea11d9c330e27148de87abdf.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              //'Product ${index + 1}',
                              'Iphone 14 Pro Max',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              //'${widget.productDTO.price}',
                              '1099 USD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kGreenColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // xử lý giảm số lượng sản phẩm
                                  },
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    // xử lý tăng số lượng sản phẩm
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.temporaryprice,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '3297 USD',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kGreenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AddressInfo(
              selectedAddressIndex: selectedAddressIndex,
              addresses: addresses,
              onAddressSelected: (int index) {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      //'DISCOUNT',
                      AppLocalizations.of(context)!.discount.toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.enterDiscountCode,
                            border: OutlineInputBorder(),
                            isDense: true,
                            prefixIcon: Icon(Icons.arrow_downward),
                          ),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: EdgeInsets.only(right: 20, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          //Xử lý áp dụng mã giảm giá
                        },
                        child: Text(
                          AppLocalizations.of(context)!.apply,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kGreenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.total,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '3297 USD',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kGreenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationHomePage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                  label: Text(
                    AppLocalizations.of(context)!.continueShopping,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text(
                    AppLocalizations.of(context)!.checkout,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 194, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
