import 'package:flutter/material.dart';

class NestedScrollViewDemoTwo extends StatefulWidget {
  NestedScrollViewDemoTwo({Key key,}) : super(key: key);

  @override
  _DemoTwoPageState createState() =>_DemoTwoPageState();

}

class _DemoTwoPageState extends State<NestedScrollViewDemoTwo>  {


  @override
  void initState() {

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[


           /*   SliverAppBar(
            title: Text("标题"),
            floating: false,
            snap: false,
            pinned: true,
          )
*/


            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              snap: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("标题",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    "images/bg.jpg",
                    fit: BoxFit.fill,
                  )
              ),
            )


          ];
        },
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title:Text( "标题$index"),);
          },
          itemCount: 50,
        ),
      ),

    );

  }

}