import 'dart:math';

import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple[100]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();

    //? Moves starting point to center of screen
    path.moveTo(0, size.height / 2);

    //? Draws line from start point to specified point
    path.lineTo(size.width / 2, 3 * size.height / 4);
    path.moveTo(size.width / 2, 3 * size.height / 4);
    path.lineTo(size.width, size.height / 2);
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height / 4);
    path.moveTo(size.width / 2, size.height / 4);
    path.lineTo(0, size.height / 2);
    path.moveTo(size.width / 2, size.height / 2);

    num degToRad(num deg) => deg * (pi / 180.0);

    //? ArcTo takes a 1. Rect (Circle , Oval , etc) 2. Start angle 3. Sweep angle
    path.arcTo(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 10,
      ),
      degToRad(0).toDouble(),
      degToRad(-180).toDouble(),
      true,
    );

    //! Close the path
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
