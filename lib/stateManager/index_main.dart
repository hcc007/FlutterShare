import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_share/stateManager/user_provider.dart';
import 'package:provider/provider.dart';

import 'BasicCounter.dart';
import 'EventProvider.dart';
import 'my_event_page.dart';
import 'my_userpage.dart';

void main() => runApp(
  //  MyApp()
    MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => BasicCounter(0)),
          FutureProvider(builder: (_) => UserProvider().loadUserData()),
          StreamProvider(builder: (_) => EventProvider().intStream(), initialData:ThemeData.light())
        ],
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



   return MaterialApp(
        title: 'Flutter Demo',
       // theme: ThemeData.light(),
      //  theme: themeData,
        theme:  Provider.of<ThemeData>(context),


        home:  DefaultTabController(
            length: 3,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Provider Demo：" ),
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.add)),
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.message)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    HomePage(),
                    MyUserPage(),
                    MyEventPage(),
                  ],
                ),
              ),
            )
        )

    );
  }
}




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<BasicCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}


