import 'dart:math';

import 'package:flutter/material.dart';

class HexagonPage extends StatelessWidget {
  final int? discount;
  final double height;
  const HexagonPage({Key? key, required this.discount, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Set the desired height
      child: CustomPaint(
        painter: HexagonPainter(),
        child: Center(
          child: Text(
            '$discount%',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 252, 185, 61)
      ..style = PaintingStyle.fill;

    final double radius = size.height / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    const double angle = 2 * pi / 6; // 60 degrees in radians

    Path path = Path();
    path.moveTo(centerX + radius * cos(0.0), centerY + radius * sin(0.0));

    for (int i = 1; i <= 6; i++) {
      double x = centerX + radius * cos(angle * i);
      double y = centerY + radius * sin(angle * i);
      path.lineTo(x, y);
    }

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(pi / 2); // Rotate 90 degrees
    canvas.translate(-size.width / 2, -size.height / 2);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HexagonPainter oldDelegate) => false;
}