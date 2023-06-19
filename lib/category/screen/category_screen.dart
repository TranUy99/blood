import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryType;
  const CategoryScreen({Key? key, required this.categoryType}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryType),
      ),
    );
  }
}
