import 'package:flutter/material.dart';

class TopPainter extends CustomPainter {
  int pixelCount;
  TopPainter({required this.pixelCount});
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPainter = Paint();
    myPainter.color = Colors.green;
    myPainter.style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * .6 - pixelCount);
    path.lineTo(size.width, size.height * .4 - pixelCount);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, myPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomPainter extends CustomPainter {
  int pixelCount;
  BottomPainter({required this.pixelCount});
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPainter = Paint();
    myPainter.color = Colors.blue;
    myPainter.style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .6 + pixelCount);
    path.lineTo(size.width, size.height * .4 + pixelCount);
    path.lineTo(size.width, size.height + pixelCount);
    canvas.drawPath(path, myPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
