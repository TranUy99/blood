import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Column(
        children: [
          Image.network(
            'https://i.pinimg.com/564x/57/ed/fc/57edfc5772c701e6b541c2ae77eb818c.jpg',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text(
            'Product Name',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            'Product Description',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
          Text(
            'Product Price',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
