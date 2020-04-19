import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/perspective/FlipWidget.dart';


class FutureBuilderMain extends StatefulWidget {
  @override
  _FutureBuilderMainMainState createState() => _FutureBuilderMainMainState();
}

class _FutureBuilderMainMainState extends State<FutureBuilderMain> {


  bool _switchValue;
  final AsyncMemoizer _memoizer = AsyncMemoizer();


  @override
  void initState() {
    super.initState();
    this._switchValue = false;

  }



  @override
  Widget build(BuildContext context) {


    return new Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },



          ),
          FutureBuilder(
              future: this._fetchData(_switchValue),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  default:
                    return Center(
                        child: Text(snapshot.data)
                    );
                }
              }
          ),
        ],
      ),

    );


  }

  _fetchData(bool flag) async{
    if(flag){
      return this._memoizer.runOnce(() async {
        await Future.delayed(Duration(seconds: 2));
        return 'REMOTE DATA';
      });
    }else{
      await Future.delayed(Duration(seconds: 5));
      return 'REMOTE DATA';
    }
  }

}