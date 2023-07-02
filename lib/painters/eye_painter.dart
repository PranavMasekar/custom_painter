import 'package:flutter/material.dart';

class EyePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple[100]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path();

    path.moveTo(0, size.height / 2);

    path.quadraticBezierTo(
      size.width / 2,
      0.7 * size.height,
      size.width,
      size.height / 2,
    );
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 3.35,
      size.width,
      size.height / 2,
    );
    path.moveTo(size.width / 2, size.height / 2);
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 5,
      ),
    );

    //! Close the path
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
