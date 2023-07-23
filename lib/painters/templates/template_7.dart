import 'package:flutter/material.dart';

class TemplateSeven extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF2B2E33)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();
    path.lineTo(120, 0);
    path.lineTo(120, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
