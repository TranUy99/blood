
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/features/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../languages/language.dart';
import '../../../languages/language_contanst.dart';
import '../../../main.dart';
import '../../constant/color/color.dart';

import '../home_page/view/navigation_home_page.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});



  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {


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
        borderRadius:
            BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (successLoginState.onLoginState && successLoginState.isVerified)
              ? SizedBox(
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.05
                      : MediaQuery.of(context).size.height * 0.08,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${getUser.email}" ?? ''),
                        TextButton(
                            onPressed: () async {
                              SharedPreferences preferences = await SharedPreferences.getInstance();
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
                              getUser.password = preferences.getString('password');

                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NavigationHomePage()));
                            },
                            child: Text(
                              '${AppLocalizations.of(context)?.logout}',
                              style: const TextStyle(
                                color: kRedColor,
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
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
    preferredSize: (successLoginState.onLoginState && successLoginState.isVerified)
        ? MediaQuery.of(context).orientation == Orientation.portrait
            ? Size.fromHeight(MediaQuery.of(context).size.height * 0.2)
            : Size.fromHeight(MediaQuery.of(context).size.height * 0.35)
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
                ))
            : Image(
                image: const AssetImage('assets/images/banner0.jpg'),
                height: MediaQuery.of(context).size.height * 0.06),
        actions: [
          DropdownButton<Language>(
            iconSize: 30,
            icon: Image.asset('assets/icon/language_option.png',
                height: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.045
                    : MediaQuery.of(context).size.height * 0.1),
            onChanged: (Language? language) async {
              if (language != null) {
                Locale _locale = await setLocale(language.languageCode);
                MyApp.setLocale(context, _locale);
              }
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(e.name),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        flexibleSpace: const CustomAppBar()),
  );
}
