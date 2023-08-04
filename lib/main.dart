import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mobile_store/languages/language_contanst.dart';
import 'package:mobile_store/src/constant/utils/get_user.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/network/network_binding.dart';
import 'src/core/network/network_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _autoLogin();
  await _getUser();
  final NetworkController networkContrroller = Get.put(NetworkController());
  networkContrroller.onInit();
  runApp(const MyApp());
}

_autoLogin() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  getUser.email = preferences.getString('email');
  getUser.idUser = preferences.getInt('idUser');
  getUser.token = preferences.getString('token');
  getUser.password = preferences.getString('password');
  getUser.isRemember = preferences.getBool('isRemember');
  if (getUser.token != null && getUser.idUser != null) {
    successLoginState.onLoginState = true;
  } else {
    successLoginState.onLoginState = false;
  }
  print('${getUser.email} - ${getUser.idUser} - ${getUser.password} - ${getUser.token}');
}

GetUser getUser = GetUser();

_getUser() async {
  if (successLoginState.onLoginState) {
    getUser.userDTO = await UserService.userService(getUser.idUser!, getUser.token!);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: NetworkBinding(),
        debugShowCheckedModeBanner: false,
        title: "Mobile Store",
        theme: ThemeData(fontFamily: 'Poppins'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        home: const NavigationHomePage());
  }
}
