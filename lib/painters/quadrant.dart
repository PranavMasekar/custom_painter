import 'dart:math';

import 'package:flutter/material.dart';

class QuadrantPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const gradient = LinearGradient(
      colors: [Color(0xffBA5370), Color(0xffF4E2D8)],
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
    );

    Paint paint = Paint()
      ..color = Colors.blue
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;
    Offset center = const Offset(0, 0);
    double radius = size.width / 2;

    Path path = Path();
    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + radius, center.dy);
    path.lineTo(center.dx, center.dy + radius);
    path.arcTo(
      Rect.fromCircle(center: center, radius: size.width / 2),
      0,
      pi / 2,
      true,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
