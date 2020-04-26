
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    // 从左上角起点到右下角终点
    path.relativeMoveTo(size.width/4,size.height/4);
    path.relativeLineTo(size.width, size.height);
    canvas.drawPath(path, paint);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}