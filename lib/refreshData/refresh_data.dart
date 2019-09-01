import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RefreshDataPage extends StatefulWidget {

  RefreshDataPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RefreshDataPageState createState() => _RefreshDataPageState();
}



///最新消息
const String LAST_NEWS = "https://news-at.zhihu.com/api/4/news/latest";

///历史消息
const String HISTORY_NEWS = "https://news-at.zhihu.com/api/4/news/before/";

class _RefreshDataPageState extends State<RefreshDataPage> {


  ///网络请求
  Response response;
  Dio dio = new Dio();

  Future getDataFuture;

  bool isShowProgress = false;

  //当前日期
  String currentDate = "";

  ScrollController _scrollController = ScrollController();

  List<dynamic> items = new List();




  @override
  void initState() {
    super.initState();
    getDataFuture = getItemNews();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("get more");
        _getMore(currentDate);
      }
    });

  }
  ///获取最新消息
  Future<List<dynamic> > getItemNews() async{
    items.clear();

    print("开始获取最新消息.");
    response = await dio.get(LAST_NEWS);
    currentDate = response.data["date"].toString();

    if(response.data["stories"] != null){
      items.addAll(response.data["stories"]);
    }

    if(items.length < 6){
      _getMore(currentDate);
    }


    return items;
  }



  _getMore(String date) async{
    if(date == "")
      return;

    setState(() {
      isShowProgress = true;
    });

    Map<String, dynamic> historyMap ;
    response = await dio.get(HISTORY_NEWS + date);
    historyMap = response.data;

    if(historyMap != null && historyMap.length > 0){
      List<dynamic> stories = historyMap["stories"];
      if(stories != null && stories.length > 0){
        currentDate = historyMap["date"].toString();
      }


      if(response.data["stories"] != null){
        items.addAll(response.data["stories"]);
      }


    }

    setState(() {
      isShowProgress = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新上滑加载数据"),
      ),

      body:  RefreshIndicator(
        onRefresh: getItemNews,
        child:   FutureBuilder<List<dynamic>>(
          future: getDataFuture,
          builder: (context,AsyncSnapshot<List<dynamic>> async){
            ///正在请求时的视图
            if (async.connectionState == ConnectionState.active || async.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("loading..."),
              );
            }
            ///发生错误时的视图
            if (async.connectionState == ConnectionState.done) {
              if (async.hasError) {
                return Center(
                  child: Text("error"),
                );
              } else if (async.hasData && async.data != null && async.data.length > 0) {

                List resultList = async.data;

                return  ListView.builder(
                    controller: _scrollController,
                    itemCount: resultList.length + 1,
                    itemExtent: 100.0,
                    itemBuilder: (BuildContext context, int index) {
                      return index < async.data.length  ?  Container(
                        child:  Card(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(resultList[index]["title"].toString(),style: TextStyle(fontSize:20),),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                ),
                                flex: 2,
                              ),

                              Expanded(
                                child: Container(
                                  child:Image.network(resultList[index]["images"][0].toString()),
                                  padding: EdgeInsets.all(5),
                                ),
                                flex: 1,
                              ),

                            ],
                          ),
                        ),
                        height: 50,
                      ): Center(
                        child: isShowProgress? CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ):Container(),
                      );

                    }
                );



              }else{
                return Center(
                  child: Text("error"),
                );
              }
            }
            return Center(
              child: Text("error"),
            );
          },
        ),

      ),

    );
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


}