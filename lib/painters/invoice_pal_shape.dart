import 'dart:math';

import 'package:flutter/material.dart';

class InvoicePalPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple[100]!
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();

    path.moveTo(0, size.height / 2 - 20);

    path.lineTo(size.width / 2 + 25, size.height / 2 - 20);
    path.lineTo(size.width / 2 - 20, size.height / 2 + 20);
    path.lineTo(0, size.height / 2 + 20);
    path.close();
    canvas.drawPath(path, paint);

    //! Circle
    num degToRad(num deg) => deg * (pi / 180.0);
    const gradient = LinearGradient(
      colors: [Color(0xffBA5370), Color(0xffF4E2D8)],
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
    );

    Path newPath = Path();
    Paint newPaint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..color = Colors.cyanAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    newPath.arcTo(
      Rect.fromCircle(
        center: const Offset(0, 0),
        radius: size.width / 2,
      ),
      degToRad(0).toDouble(),
      degToRad(359).toDouble(),
      true,
    );
    canvas.drawPath(newPath, newPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
