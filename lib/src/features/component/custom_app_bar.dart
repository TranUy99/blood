import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_store/src/core/model/product_detail_cart.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_bloc.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_state.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../constant/color/color.dart';
import '../../core/model/order_product_dto.dart';
import '../category/widget/menu_button.dart';
import '../home_page/view/navigation_home_page.dart';
import '../search/view/search.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  static GetLengthCartBloc getLengthCartBloc = GetLengthCartBloc();

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CartViewModel cartViewModel = CartViewModel();
  List<OrderProductDTO> cartList = [];
  int length = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      length = cartViewModel.cartLength();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
        ),
        color: kDarkGreyColor,
        boxShadow: const [BoxShadow(blurRadius: 50.0)],
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MenuButton(),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()));
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kGreyColor, width: 1),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: DefaultTextStyle(
                              style: GoogleFonts.lato(
                                color: kGreenColor,
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'Search...',
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                  TyperAnimatedText(
                                    'R2S..',
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                  TyperAnimatedText(
                                    'Mobile Store',
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Search()));
                                },
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            color: kGreenColor,
                          ),
                        ]),
                      ),
                    )),
                StreamBuilder<GetLengthCartState>(
                  initialData: GetLengthCartState(length),
                  stream: CustomAppBar.getLengthCartBloc.stateController.stream,
                  builder: (context, snapshot) {
                    return IconButton(
                        onPressed: () {
                          setState(() {
                            indexScreen = 1;
                          });
                          Get.offAll(const NavigationHomePage());
                        },
                        icon: successLoginState.onLoginState
                            ? Badge(
                            label: Text('${snapshot.data?.cartListLength}'),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ))
                            : const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ));
                  },
                )

              ],
            ),
          ),
          (successLoginState.onLoginState)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getUser.userDTO.fullName ?? ''),
                      TextButton(
                          onPressed: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            if (getUser.isRemember == false) {
                              preferences.remove('email');
                              preferences.remove('password');
                            }
                            preferences.remove('id');
                            preferences.remove('token');
                            successLoginState.onLoginState = false;
                            indexScreen = 0;
                            getUser.email = preferences.getString('email');
                            getUser.idUser = preferences.getInt('idUser');
                            getUser.token = preferences.getString('token');
                            getUser.password =
                                preferences.getString('password');

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationHomePage()));
                          },
                          child: const Text(
                            'Log out',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 15,
                            ),
                          ))
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

PreferredSizeWidget? appBarWidget(BuildContext context, bool isBack) {
  return PreferredSize(
    preferredSize: successLoginState.onLoginState
        ? Size.fromHeight(MediaQuery.of(context).size.height * 0.2)
        : Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
    child: AppBar(
        backgroundColor: kSecondaryColor,
        leading: isBack
            ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )):
        Image(
            image: const AssetImage('assets/images/banner0.jpg'),
            height: MediaQuery.of(context).size.height * 0.06),
        flexibleSpace: CustomAppBar()),
  );
}
