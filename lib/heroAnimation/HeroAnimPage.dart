import 'package:flutter/material.dart';

import 'HeroAnimationRouteB.dart';

class Heroanimpage extends StatefulWidget {
  Heroanimpage({Key key}) : super(key: key);

  @override
  _HeroanimpageState createState() => _HeroanimpageState();
}

class _HeroanimpageState extends State<Heroanimpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
          child:Container(

            margin: EdgeInsets.only(top: 50),
            child:  ClipOval(
              child: Image.asset("images/avatar.jpg",
                width: 50.0,
              ),
            ),
          ),
        ),
        onTap: () {
          //打开B路由
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              })
          );
        },
      ),
    );  }
}