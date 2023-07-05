import 'package:flutter/material.dart';
import 'package:mobile_store/languages/language_contanst.dart';
import 'package:mobile_store/src/core/network/network_manager.dart';
import 'package:mobile_store/src/ui/homePage/screen/navigation_home_page.dart';
import 'package:mobile_store/src/ui/change_password/view/change_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'src/core/network/network_binding.dart';

void main() {
   final NetworkController networkContrroller = Get.put(NetworkController());
  networkContrroller.onInit();

  runApp(const MyApp());
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
        // home: ChangePasswordScreen());
        //home: LogInScreen());
        home: NavigationHomePage());
    // home: ProfilePage());
  }
}
