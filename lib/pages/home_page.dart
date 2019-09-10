import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  Color _primaryColor;
  String _title;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _primaryColor = Colors.green;
    _title = "Home";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: _primaryColor,
          title: Text(_title),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.search,
                size: 28,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.more_vert,
                size: 28,
                color: Colors.black,
              ),
            )
          ],
          bottom: TabBar(
              onTap: _onTap,
              indicatorColor: Colors.white,
              indicatorWeight: 6,
              controller: _controller,
              tabs: [
                Tab(
                  child: Container(
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Favour',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Trend',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Recom',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ]),
        ),
        body: TabBarView(controller: _controller, children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.green.shade800,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.green.shade800,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.green.shade800,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.green.shade800,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.green.shade800,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          Text("hello2"),
          Text("hello3"),
          Text("hello4")
        ]));
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        setState(() {
          _primaryColor = Colors.red;
          _title = 'Home';
        });
        break;
      case 1:
        setState(() {
          _primaryColor = Colors.amber;
          _title = 'Favourite';
        });
        break;
      case 2:
        setState(() {
          _primaryColor = Colors.deepOrange;
          _title = 'Trending';
        });
        break;
      case 3:
        setState(() {
          _primaryColor = Colors.pink;
          _title = 'Recomm';
        });
    }
  }
}
