import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatelessWidget {
  Widget child;

  FlipWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Transform(
          transform: Matrix4.identity()..setEntry(3, 2, 0.006)..rotateX(pi / 4),
          alignment: Alignment.bottomCenter,
          child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: child,
              )),
        ),


//        ClipRect(
//            child: Align(
//              alignment: Alignment.topCenter,
//              heightFactor: 0.5,
//              child: child,
//            )),
//


        Padding(
          padding: EdgeInsets.only(top: 2.0),
        ),
        ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.5,
              child: child,
            )),
      ],
    );
  }
}