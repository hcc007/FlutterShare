import 'package:flutter/material.dart';
import 'package:flutter_share/perspective/FlipWidget.dart';

import 'FlipPanel.dart';

class FlipAnimationMain extends StatefulWidget {
  @override
  _FlipAnimationMainState createState() => _FlipAnimationMainState();
}


class _FlipAnimationMainState extends State<FlipAnimationMain> {

  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,];


  @override
  Widget build(BuildContext context) {

    //实现绕 X 轴旋转效果
//    return Scaffold(
//      body: Center(
//        child:FlipWidget(
//          child:       Container(
//            width: 300,
//            height: 200,
//           // color: Colors.green,
//            child:  Image.asset(
//              "images/bg.jpg",
//              fit: BoxFit.fill,
//            ),
//          ),
//        )
//
//
//      ),
//    );



  ///实现翻页效果
    return new Scaffold(

      body: new Center(
        child: FlipPanel.builder(
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            width: 96.0,
            height: 128.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Text(
              '${digits[index]}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                  color: Colors.yellow),
            ),
          ),
          itemsCount: digits.length,
          period: Duration(milliseconds: 1000),
          loop: -1,
        ),
      ),
    );





  }




}