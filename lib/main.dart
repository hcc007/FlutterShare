import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/path/PathAdvancedMain.dart';
import 'package:flutter_share/path/PathBasicsMain.dart';
import 'package:flutter_share/perspective/FlipAnimationMain.dart';
import 'package:flutter_share/perspective/PerspectiveMain.dart';
import 'package:flutter_share/refreshData/refresh_data.dart';
import 'package:flutter_share/scheme/router.dart';
import 'package:flutter_share/stateManager/models/cart.dart';
import 'package:flutter_share/stateManager/models/catalog.dart';
import 'package:flutter_share/stateManager/screens/cart.dart';
import 'package:flutter_share/stateManager/screens/catalog.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import 'FutureBuilderProblem/FutureBuilderMain.dart';
import 'animatedIcon/AnimatedIconPage.dart';
import 'animatedSwitcher/AnimatedSwitcherCounterRoute.dart';
import 'autocomplete/OverlayMain.dart';
import 'chartsDisplay/ChartDispalyMain.dart';
import 'downloadDemo/DownDemoMain.dart';
import 'flutterSearch/searchbarview.dart';
import 'heroAnimation/HeroAnimPage.dart';
import 'heroAnimation/RadialExpansionDemo.dart';
import 'implicitAnimation/AnimatedContainerDemo.dart';
import 'implicitAnimation/FadeInDemo.dart';
import 'navigationrail/NavigationRailMain.dart';
import 'nestedScrollView/DemoOne.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


 /*   return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
*/
    ///MultiProvider 可以提供多个 model
    return MultiProvider(
      providers: [
        ///不变的数据类型，使用 model 就足够了
        Provider(builder: (context) => CatalogModel()),

        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            builder: (context, catalog, previousCart) =>
                CartModel(catalog, previousCart)),

      ],

      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        // routes: {
        //   '/catalog': (context) => MyCatalog(),    ///类别
        //   '/cart': (context) => MyCart(),
        // },
        routes: MyRouter().registerRouter(),



        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );





  }
}






/// eum 类型
enum UniLinksType {
  /// string link
  string,
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  UniLinksType _type = UniLinksType.string;
  StreamSubscription _sub;
  MyRouter router = MyRouter();

  @override
  void initState() {
    super.initState();
    //  scheme初始化，保证有上下文，需要跳转页面
    initPlatformState();
  }


  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    }
  }

  /// 使用[String]链接实现
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      if (initialLink != null) {
        //  跳转到指定页面
        router.push(context, initialLink);
      }
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted || link == null) return;
      //  跳转到指定页面
      router.push(context, link);
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }




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


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("全局状态管理"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {

              Navigator.pushNamed(context, "/catalog");



            },

          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter 搜索页面"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new SearchBarView();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter AnimatedIcon "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new AnimatedIconPage();
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },

          ),





          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("绘制图表"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: ChartDispalyMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));

            },

          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("全局弹窗(输入补全)"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: OverlayMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));

            },

          ),



          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("3d 旋转"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: PerspectiveMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));

            },

          ),



          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("3d 翻页效果"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: FlipAnimationMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));

            },

          ),



          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("FutureBuilderDemo"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: FutureBuilderMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Path 基础"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: PathBasicsMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Path 进阶"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: PathAdvancedMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),



          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("下载文件"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: DownDemoMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),



          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("NavigationRail "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: NanigationRailMain(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),





          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("FadeInDemo "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: FadeInDemo(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),




          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("AnimatedContainerDemo "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: AnimatedContainerDemo(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
            },
          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Flutter AnimatedSwitcher Demo "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: AnimatedSwitcherCounterRoute(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },
          ),






          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Hero 动画 "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: Heroanimpage(),);
                    //return new NestedScrollViewDemoTwo();
                  }));
              //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

            },
          ),


          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Hero 径向动画 "),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              //导航到新路由
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new Scaffold(body: RadialExpansionDemo(),);
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
