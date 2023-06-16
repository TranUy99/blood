import 'package:flutter/material.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: whiteGrayColor,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  const Icon(
                    Icons.search,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
