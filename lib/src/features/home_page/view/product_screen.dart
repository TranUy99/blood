import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';

import '../../measure/view/measure.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.news,
                style: const TextStyle(
                  fontSize: 20,
                  color: kRedColor,
                  fontFamily: 'sans-serif',
                ),
              ),
              const Image(
                image: AssetImage('assets/icon/fire_icon.png'),
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Measure(),),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 180, 223, 241),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreenColor, width: 2)),
                  height: 150,
                  width: 150,
                  child: const Image(
                    image: AssetImage('assets/icon/do huyet ap.png'),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Appointment(),),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 180, 223, 241),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreenColor, width: 2)),
                  height: 150,
                  width: 150,
                  child: const Image(
                    image: AssetImage('assets/images/always-on-display.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
