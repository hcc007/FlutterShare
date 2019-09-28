import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ///使用 ChangeNotifierProvider ，这个 Provider 将数据 model 粘合在一起，数据改变时，保证 MyApp 或者其子 Widget ui 更新。
    ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      ///builder 会指定数据 model 并初始化。
      builder: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
///
///
class Counter with ChangeNotifier {
  ///这个 model 只管理一个变量。
  int value = 0;

  ///操作变量
  void increment() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ///通过 Provider.of 方式获取 model
    final _counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('使用 Consumer 获取 model:'),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.

            ///Consumer 回向上寻找 Provider 类型的父类 Widget,并且取出 Provider 关联的 Model,根据这个 model 来构建 widget
            ///并且当 model 数据发生改变时，回触发更新。
            ///

            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),

            Text('使用 Provider.of 方式 获取 model:'),
            Text('${_counter.value}',),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// listen 为 false 表示不监听状态改变，默认时 true
        onPressed: () => Provider.of<Counter>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),


      ///需要修改 Model 同样可以使用 Consumer 的方式
//        floatingActionButton: Consumer<Counter>(
//          builder: (context, Counter counter, child) => FloatingActionButton(
//            onPressed: counter.increment,
//            child: child,
//          ),
//          child: Icon(Icons.add),
//        ),


    );
  }
}
