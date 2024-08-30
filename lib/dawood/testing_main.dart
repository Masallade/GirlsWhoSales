import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/provider_model/about_us_state_management.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AboutUsStateManagement(),
      child: CustomShapeContainer(),
    ),
  );
}


class CustomShapeContainer extends StatelessWidget {
  const CustomShapeContainer({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      child: CustomPaint(
        painter: MyCustomPainter(),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the path of the shape here
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    // ... Add more points to define the shape
    path.close();

    // Draw the shape on the canvas
    final paint = Paint()..color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}