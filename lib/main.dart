import 'package:flutter/material.dart';
import 'package:mobile_store/languages/language_contanst.dart';
import 'package:mobile_store/src/ui/homePage/screen/home_page.dart';
import 'package:mobile_store/src/ui/homePage/screen/navigation_home_page.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/change_password.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/ui/profilePage/screen/profile_page.dart';

void main() {
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mobile Store",
        theme: ThemeData(fontFamily: 'Poppins'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        //home: ChangePasswordScreen());
        home: LogInScreen());
    // home: NavigationHomePage());
    // home: ProfilePage());
    // home: HomePage());
  }
}
