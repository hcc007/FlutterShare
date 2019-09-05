import 'package:flutter/material.dart';

class NestedScrollViewDemoOne extends StatefulWidget {
  NestedScrollViewDemoOne({Key key,}) : super(key: key);

  @override
  _DemoOnePageState createState() =>_DemoOnePageState();

}

class _DemoOnePageState extends State<NestedScrollViewDemoOne>   with SingleTickerProviderStateMixin{

  TabController _tabController;
  ScrollController _scrollviewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollviewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _scrollviewController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollviewController,
          headerSliverBuilder: (context, boxIsScrolled) {

            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0.5,
                forceElevated: true,
                //backgroundColor: Colors.grey,
                expandedHeight: 240,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin, //视差效果
                  background: Container(
                    //color: Colors.grey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 210.0,
                          width: 420,
                          color: Colors.blue,
                          child: Image.asset(
                            "images/bg.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(controller: _tabController, tabs: [
                  Tab(
                    text: "首页",
                  ),
                  Tab(
                    text: "消息",
                  ),
                  Tab(
                    text: "购物",
                  ),
                  Tab(
                    text: "我的",
                  )
                ]),
              ),



            ];

          },

          body: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child:  Text("one"),
                ),

                Center(
                  child:  Text("two"),
                ),

                Center(
                  child:  Text("three"),
                ),

                Center(
                  child:  Text("four"),
                ),

              ]

          )
      ),
    );

  }

}