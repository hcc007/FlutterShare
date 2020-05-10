import 'package:flutter/material.dart';
import 'package:flutter_share/path/Circles.dart';
import 'package:flutter_share/path/DashLinePainter.dart';
import 'package:flutter_share/path/LinePainter.dart';

import 'Planets.dart';
import 'Polygon.dart';
import 'Spiral.dart';

class PathAdvancedMain extends StatefulWidget {
  @override
  _PathAdvancedMainState createState() => _PathAdvancedMainState();
}

class _PathAdvancedMainState extends State<PathAdvancedMain>    {


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;



   return ListView(
      children: <Widget>[

        SizedBox(width: width,height: 20,),
//
//        Container(
//          width: width,
//          height: 50,
//          alignment: Alignment.center,
//          child:      Text("直线(百分之50比例)"),
//        ),
//
//        CustomPaint(
//          painter:LinePainter(progress: 0.5),
//        ) ,
//
//
//
//        Container(
//          width: width,
//          height: 50,
//          alignment: Alignment.center,
//          child:      Text("虚线"),
//        ),
//
//        CustomPaint(
//          painter:DashLinePainter(progress: 0.9),
//        )
//



        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("画圆"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            Navigator.push( context,
                new MaterialPageRoute(builder: (context) {
                  return new Scaffold(body: Circles(),);
                  //return new NestedScrollViewDemoTwo();
                }));
          },
        ),





        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("绘制多边形"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            Navigator.push( context,
                new MaterialPageRoute(builder: (context) {
                  return new Scaffold(body: Polygon(),);
                  //return new NestedScrollViewDemoTwo();
                }));
          },
        ),








        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("螺旋曲线"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            Navigator.push( context,
                new MaterialPageRoute(builder: (context) {
                  return new Scaffold(body: Spiral(),);
                  //return new NestedScrollViewDemoTwo();
                }));
          },
        ),





        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("星空动画"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            Navigator.push( context,
                new MaterialPageRoute(builder: (context) {
                  return new Scaffold(body: Planets(),);
                  //return new NestedScrollViewDemoTwo();
                }));
          },
        ),













      ],
    );


  }


}