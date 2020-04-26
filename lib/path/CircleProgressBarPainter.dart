import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CircleProgressBarPainter extends CustomPainter {
  //背景
  Paint _paintBackground;

  //前景
  Paint _paintForeground;

  var currentValue;

  CircleProgressBarPainter(this.currentValue) {

    _paintBackground = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;

    _paintForeground = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;

  }
  @override
  void paint(Canvas canvas, Size size) {

    //画背景
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);


    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    //画弧形进度
    canvas.drawArc(rect, 0.0, currentValue * Math.pi / 180, false, _paintForeground);
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}