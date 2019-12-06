// EventProvider (Stream)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class EventProvider {

  Stream<ThemeData> intStream() {
    Duration interval = Duration(seconds: 2);
   // ThemeData  themeData = _themeData == ThemeData.light()?ThemeData.dark():ThemeData.light()
    return Stream<ThemeData>.periodic(interval, (int _count) => _count %2 == 0?ThemeData.light():ThemeData.dark() );
   //return Stream<int>.periodic(interval, (int _count) => _count %2 == 0? 11: 22  );
  // return Stream<int>.periodic(interval, (int _count) => _count++);

  }


}