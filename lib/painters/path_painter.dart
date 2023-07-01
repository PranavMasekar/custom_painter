import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple[100]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Path path = Path();
    //! Moves starting point to center of screen
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
