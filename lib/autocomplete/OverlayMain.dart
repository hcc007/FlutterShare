
import 'package:flutter/material.dart';

import 'CountriesField.dart';


class OverlayMain extends StatefulWidget {
  @override
  _OverlayMainState createState() => _OverlayMainState();
}


class _OverlayMainState extends State<OverlayMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          child: ListView(
            children: <Widget>[

              CountriesField(
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),

              ),

              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'City'
                ),
              ),
              SizedBox(height: 16.0,),

              SizedBox(height: 16.0,),
              RaisedButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  Toast.show(context: context, message: "信息已经提交!");
                },
              )
            ],
          ),
        ),
      ),
    );


  }




}


//通过 Overlay 实现 Toast
class Toast {
  static void show({@required BuildContext context, @required String message}) {

    //1、创建 overlayEntry
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.8,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),

                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
          ));
    });


    //插入到 Overlay中显示 OverlayEntry
    Overlay.of(context).insert(overlayEntry);


    //延时两秒，移除 OverlayEntry
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    }
    );
  }
}
