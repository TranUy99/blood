import 'package:flutter/material.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/features/measure/view/blood.dart';
import 'package:mobile_store/src/features/measure/view/chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constant/color/color.dart';
import '../../component/custom_app_bar.dart';
import '../../home_page/view/navigation_home_page.dart';
import '../../login/bloc/login_bloc.dart';

class Measure extends StatefulWidget {
  const Measure({super.key});

  @override
  State<Measure> createState() => _MeasureState();
}

class _MeasureState extends State<Measure> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kWhiteColor, kDarkGreyColor, kZambeziColor],
                ),
                color: kDarkGreyColor,
                boxShadow: [BoxShadow(blurRadius: 50.0)],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(MediaQuery.of(context).size.width, 20)),
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: const Text('Blood Pressure Monitoring'),
            backgroundColor: Color.fromARGB(117, 100, 193, 234),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Enter Blood Pressure',
                  icon: Icon(Icons.home),
                ),
                Tab(text: 'History', icon: Icon(Icons.directions_transit)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [BloodPage(), ChartPage()],
          ),
        ),
      ),
    );
  }
}
