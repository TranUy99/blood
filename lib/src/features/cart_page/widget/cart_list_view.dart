import 'package:flutter/material.dart';

class CartListView extends StatefulWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Iphone 14'),
                    const Text('price'),
                    Row(
                      children: [
                        TextButton(onPressed: () {

                        }, child: const Text('-', style: TextStyle(fontSize: 30),)),

                        Text('1'),

                        TextButton(onPressed: () {

                        }, child: Text('+', style: TextStyle(fontSize: 30),))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
