import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(title: '$index'),));
          },
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.45,
                  color: Colors.cyanAccent,
                ),
                Text('So so long title in this grid view $index'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price'),
                    Text('Sold number $index'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
 class Detail extends StatelessWidget {
  final String title;
   const Detail({Key? key, required this.title}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Text(title),
       ),
     );
   }
 }
 