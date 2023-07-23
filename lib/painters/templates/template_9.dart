import 'package:flutter/material.dart';

class TemplateNine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff0C134F)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 150);
    path.lineTo(0, 300);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
