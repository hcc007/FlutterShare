import 'package:flutter/material.dart';
import 'package:flutter_share/refreshData/refresh_data.dart';

import 'nestedScrollView/DemoOne.dart';
import 'nestedScrollView/DemoTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:     ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[

      FlatButton(
      color: Colors.blue,
        highlightColor: Colors.blue[700],
        colorBrightness: Brightness.dark,
        splashColor: Colors.grey,
        child: Text("下拉刷新上滑加载数据"),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          //导航到新路由
          Navigator.push( context,
              new MaterialPageRoute(builder: (context) {
                return new RefreshDataPage();
              }));
          //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

        },

      ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("NestedScrollViewDemo"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new NestedScrollViewDemoOne();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),








        ]
    )
    );
  }


}
