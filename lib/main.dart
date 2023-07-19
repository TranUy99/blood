import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mobile_store/languages/language_contanst.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:mobile_store/src/features/login/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/network/network_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _autoLogin();
  await _getUser();
  runApp(const MyApp());
}

_autoLogin() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? _email = preferences.getString('email');
  int? _id = preferences.getInt('id');
  String? _token = preferences.getString('token');
  String? _password = preferences.getString('password');
  print('$_email - $_id - $_password - $_token');
  if(_password != null){
    successLoginState.onLoginState = true;
  }else{
    successLoginState.onLoginState = false;
  }
}

_getUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? id = preferences.getInt('id');
  String? token = preferences.getString('token');
  if (successLoginState.onLoginState) {
    final userResult = UserService.userService(id!, token!);
    await userResult.then((value) {
      nameUser = value.fullName;
    });
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
