import 'package:flutter/material.dart';

class NanigationRailMain extends StatefulWidget {
  @override
  NanigationRailMainState createState() => NanigationRailMainState();
}


class NanigationRailMainState extends State<NanigationRailMain>    {
  int _selectedIndex = 0;
  final padding = 8.0;

  @override
  Widget build(BuildContext context) {

//    return Scaffold(
//      body: Row(
//        children: <Widget>[
//          // Here's the important stuff
//          NavigationRail(
//            selectedIndex: _selectedIndex,
//            onDestinationSelected: (int index) {
//              setState(() {
//                _selectedIndex = index;
//              });
//            },
//            labelType: NavigationRailLabelType.selected,
//            destinations: [
//              NavigationRailDestination(
//                icon: Icon(Icons.favorite_border),
//                selectedIcon: Icon(Icons.favorite),
//                label: Text('First'),
//              ),
//              NavigationRailDestination(
//                icon: Icon(Icons.bookmark_border),
//                selectedIcon: Icon(Icons.book),
//                label: Text('Second'),
//              ),
//              NavigationRailDestination(
//                icon: Icon(Icons.star_border),
//                selectedIcon: Icon(Icons.star),
//                label: Text('Third'),
//              ),
//            ],
//          ),
//          // And now it's not that interesting
//          Expanded(
//            child: Center(
//              child: Container(
//                color: Colors.blue,
//                child:
//                Center(child: Text("Page № ${_selectedIndex.toString()}")),
//              ),
//            ),
//          )
//        ],
//      ),
//    );

    return Scaffold(
      backgroundColor: Color(0xff28292E),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              minWidth: 56.0,
              groupAlignment: 1.0,
              backgroundColor: Color(0xff2D3035),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              leading: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          "https://t9.baidu.com/it/u=86853839,3576305254&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1591363041&t=58576d535d450f80e9248bd0ee84c8c0"),
                    ),
                  ),
                  SizedBox(
                    height: 108,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: IconButton(
                      icon: Icon(Icons.tune),
                      color: Color(0xffFCCFA8),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              selectedLabelTextStyle: TextStyle(
                color: Color(0xffFCCFA8),
                fontSize: 13,
                letterSpacing: 0.8,
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
              unselectedLabelTextStyle: TextStyle(
                fontSize: 13,
                letterSpacing: 0.8,
              ),
              destinations: [
                buildRotatedTextRailDestination("Popular", padding),
                buildRotatedTextRailDestination("Favourites", padding),
                buildRotatedTextRailDestination("Inspiration", padding),
                buildRotatedTextRailDestination("All", padding),
              ],
            ),
            // This is the main content.
            ContentSpace(_selectedIndex)
          ],
        ),
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  final int _selectedIndex;

  ContentSpace(this._selectedIndex);

  final List<String> images = [
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
    "https://images.unsplash.com/photo-1513161455079-7dc1de15ef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1544457070-4cd773b4d71e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=843&q=80",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1549488344-cbb6c34cf08b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];

  final List<String> titles = [
    "Popular\nIdeas",
    "Favourites",
    "Inspiration\nIdeas",
    "All"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(titles[_selectedIndex],
                  style: TextStyle(
                    color: Color(0xffFCCFA8),
                    fontSize: 16,
                    letterSpacing: 0.8,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.0,
                  ),

              ),
              SizedBox(
                height: 24,
              ),

              for (var i in images) ImageCard(i),

            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final uri;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: Image.network(uri),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
    );
  }

  const ImageCard(this.uri);

}