import 'package:flutter/material.dart';

class TemplateTen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint newpaint = Paint()
      ..color = const Color(0xffCEB18F)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path newpath = Path();
    newpath.lineTo(230, 0);
    newpath.lineTo(200, 70);
    newpath.lineTo(0, 70);

    newpath.close();
    canvas.drawPath(newpath, newpaint);

    Paint paint = Paint()
      ..color = const Color(0xff0C134F)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();
    path.lineTo(180, 0);
    path.lineTo(150, 70);
    path.lineTo(0, 70);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
