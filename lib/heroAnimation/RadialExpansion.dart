import 'package:flutter/material.dart';
import 'dart:math' as math;
class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      child: new Center(
        child: new SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: new ClipRect(
            child: child,  // Photo
          ),
        ),
      ),
    );
  }
}
