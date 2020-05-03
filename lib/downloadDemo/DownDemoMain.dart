
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';


class DownDemoMain extends StatefulWidget {
  @override
  _DownDemoMainMainState createState() => _DownDemoMainMainState();
}


class _DownDemoMainMainState extends State<DownDemoMain>    with SingleTickerProviderStateMixin  {
  AnimationController _controller;

  final fileURl = "http://music.163.com/song/media/outer/url?id=413829859.mp3";
  bool downloading = false;
  double progress ;
  var path = "No Data";
  var platformVersion = "Unknown";
  Permission permission1 = Permission.WriteExternalStorage;
  var _onPressed;
  static final Random random = Random();
  Directory externalDir;


  @override
  void initState() {
    super.initState();


    //动画时间 5 秒
    _controller = new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _controller.addListener(() => setState(() => {}));
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



  Future<void> downloadFile() async {
    Dio dio = Dio();
    bool checkPermission1 =
    //1、权限检查
    await SimplePermissions.checkPermission(permission1);
    if (checkPermission1 == false) {
      await SimplePermissions.requestPermission(permission1);
      checkPermission1 = await SimplePermissions.checkPermission(permission1);
    }

    if (checkPermission1 == true) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      var randid = random.nextInt(10000);

      try {

        //2、创建文件
        FileUtils.mkdir([dirloc]);

        //3、使用 dio 下载文件
        await dio.download(fileURl, dirloc + randid.toString() + ".mp3",
            onReceiveProgress: (receivedBytes, totalBytes) {
              setState(() {
                downloading = true;
                //4、连接资源成功开始下载后更新状态
                progress = (receivedBytes / totalBytes) ;
              });
            });

      } catch (e) {
        print(e);
      }


      setState(() {
        downloading = false;
        progress = 0;
        path = dirloc + randid.toString() + ".mp3";
      });


    } else {
      setState(() {
        progress = 0;
        _onPressed = () {
          downloadFile();
        };
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;

    return  SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SizedBox(
            width: width,
            height: 100,
          ),

          //线性进度条进度动画
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.red)
                  .animate(_controller),
              value: _controller.value,
            ),
          ),



          //线性进度条模糊动画
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),



          Padding(
            padding: EdgeInsets.all(16),
            child:
            // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),



          //精准进度
          Padding(
            padding: EdgeInsets.all(10),
            child:
            SizedBox(
              width: 150,
              height: 150,
              child:
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.red)
                    .animate(_controller),
                value: _controller.value,

              ),
            ),

          ),



          Container(
            child: downloading
                ? Container(
              height: 200.0,
              width: 200.0,
              child:
              Padding(
                padding: EdgeInsets.all(10),
                child:
                SizedBox(
                  width: 200,
                  height: 200,
                  child:
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    value: progress,
                  ),
                ),
              ),

            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("下载文件路径:" + path),
                MaterialButton(
                  child: Text('开始下载文件'),
                  onPressed: (){
                    downloadFile();
                  },
                  disabledColor: Colors.blueGrey,
                  color: Colors.pink,
                  textColor: Colors.white,
                  height: 40.0,
                  minWidth: 100.0,
                ),
              ],
            )
          )


        ],
      ),
    );


  }



}