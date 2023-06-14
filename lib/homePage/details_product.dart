// import 'package:flutter/material.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//               left: 0,
//               right: 0,
//               child: Container(
//                 width: double.maxFinite,
//                 height: 350,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage("assets/images/samsung.png"))),
//               ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  const ProductDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Text('This is the product detail page.'),
      ),
    );
  }
}
