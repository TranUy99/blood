import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/network/network_manager.dart';
import 'package:mobile_store/src/features/cart_page/view/cart_page.dart';
import 'package:mobile_store/src/features/home_page/view/home_page.dart';
import 'package:mobile_store/src/features/login/bloc/login_state.dart';
import 'package:mobile_store/src/features/profile/view/profile_page.dart';
import '../../login/bloc/login_bloc.dart';
import '../../login/view/not_login.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

int indexScreen = 0;
List appScreens = [];

class _NavigationHomePageState extends State<NavigationHomePage> {
  final LoginBloc loginBloc = LoginBloc();
  final NetworkController _networkController = Get.put(NetworkController());
  String? email;
  int? id;
  String? token;

  List navigationLoginScreen() {
    return appScreens = [
      const HomePage(),
      const CartPage(),
      const ProfilePage()
    ];
  }

  List navigationLogoutScreen() {
    return appScreens = [const HomePage(), const NotLogin(), const NotLogin()];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(successLoginState.isVerified);
  }

  @override
  Widget build(BuildContext context) {
    bool checkInternetConnection =
        _networkController.connectionType.value == "No Internet Connection";
    return checkInternetConnection == false
        ? Scaffold(
            body: (successLoginState.onLoginState && successLoginState.isVerified)
                ? navigationLoginScreen()[indexScreen]
                : navigationLogoutScreen()[indexScreen],
            bottomNavigationBar: NavigationBar(
              height: MediaQuery.of(context).size.height * 0.07,
              onDestinationSelected: (value) => setState(() {
                indexScreen = value;
              }),
              indicatorColor: const Color.fromARGB(100, 233, 233, 233),
              selectedIndex: indexScreen,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, size: 35),
                  label: 'Home',
                  selectedIcon: Icon(
                    Icons.home,
                    size: 35,
                    color: kGreyColor,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart_outlined, size: 35),
                  label: 'Cart',
                  selectedIcon: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: kGreyColor,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined, size: 35),
                  label: 'Me',
                  selectedIcon: Icon(
                    Icons.account_circle,
                    size: 35,
                    color: kGreyColor,
                  ),
                )
              ],
            ),
          )
        : // Handle the case when there is no internet connection, e.g., show a different widget or an error message.
        Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Please check internet connection',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationHomePage(),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kGreenColor),
                      child: const Text('Reload')),
                ],
              ),
            ),
          );
  }
}
