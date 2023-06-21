import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/homePage/screen/product_detail_screen.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10/16,
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(),
              )),
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Colors.cyanAccent,
                ),
                Text('So so long title in this grid view $index'),
                Container(child: Text('Price'), width: MediaQuery.of(context).size.width * 1),
                Text('Sold number $index'),
              ],
            ),
          ),
        );
      },
    );
  }
}
