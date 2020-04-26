import 'package:flutter/material.dart';

import 'CircleProgressBarPainter.dart';
import 'PathPainter.dart';



class PathBasicsMain extends StatefulWidget {
  @override
  _PathBasicsMainMainState createState() => _PathBasicsMainMainState();
}

class _PathBasicsMainMainState extends State<PathBasicsMain>   with SingleTickerProviderStateMixin {

  Animation<double>  progressAnimation;
  AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));

    progressAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller);

    _controller.addListener(() {
      this.setState(() {});
    });




    onAnimationStart();
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;


    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(20),
      child: CustomPaint(

          child: Center(
              child: Text(
                  (progressAnimation.value / 3.6).round().toString(),
              style: TextStyle(fontSize: 24,color: Colors.blue),
              ),
          ),

          painter: CircleProgressBarPainter(progressAnimation.value)

      ),

    );

  }


}