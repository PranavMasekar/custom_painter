import 'package:flutter/material.dart';

class TemplateEight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF273D8A)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();
    path.addOval(
      Rect.fromCircle(
        center: const Offset(40, 10),
        radius: 120,
      ),
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
