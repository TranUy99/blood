import 'package:flutter/material.dart';

import '../login/srceen/login.dart';
import 'details_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                // InkWell(
                //   child: Image.network(
                //     'https://i.pinimg.com/564x/ab/3b/84/ab3b8404fbe97510cc52aa94cdfe84fd.jpg',
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ProductDetailScreen()));
                //   },
                // ),
                Image.network(
                  'https://i.pinimg.com/564x/ab/3b/84/ab3b8404fbe97510cc52aa94cdfe84fd.jpg',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(title: '$index')));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
