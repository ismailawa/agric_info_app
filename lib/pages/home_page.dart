import 'package:agriculture_information/models/productBloc.dart';
import 'package:agriculture_information/pages/login_page.dart';
import 'package:agriculture_information/pages/product_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final ProductBloc bloc;
  Home({Key key, this.bloc});
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
    _primaryColor = Colors.greenAccent;
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
                buildTab("Home"),
                buildTab("Favour"),
                buildTab("Goods"),
                buildTab("Reco"),
              ]),
        ),
        body: TabBarView(controller: _controller, children: [
          ProductPage(bloc: widget.bloc),
          LoginPage(),
          Text("hello3"),
          Text("hello4")
        ]));
  }

  Tab buildTab(String title) {
    return Tab(
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        setState(() {
          _primaryColor = Colors.greenAccent;
          _title = 'Home';
        });
        break;
      case 1:
        setState(() {
          _primaryColor = Colors.green.shade800;
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


