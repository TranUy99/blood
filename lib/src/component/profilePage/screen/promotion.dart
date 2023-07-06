import 'package:flutter/material.dart';
import 'package:mobile_store/src/component/profilePage/widget/hexagon_discount.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);
  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends   State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015),
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HexagonPage(
                      height: MediaQuery.of(context).size.height * 0.07,
                      discount: 20,
                    ),
                  ],
                ),
                title: const Text(
                    '20% discount for orders under 1500\$, for customers who bought 10000\$ '),
              ),
            );
          },
        ),
      ),
    );
  }
}
