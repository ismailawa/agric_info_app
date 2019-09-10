import 'package:flutter/material.dart';

void main() => runApp(AgricultureInfo());

class AgricultureInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  Color _primaryColor;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _primaryColor= Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _primaryColor,
          title: Text("Home"),
          bottom: TabBar(
              onTap: _onTap,
              indicatorColor: Colors.white,
              indicatorWeight: 6,
              controller: _controller, tabs: [
            Tab(
              child: Container(child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18),),),
            ),
            Tab(
              child: Container(child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18),),),
            ),
            Tab(
              child: Container(child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18),),),
            ),
            Tab(
              child: Container(child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18),),),
            )
          ]),
        ),
        body: TabBarView(
          controller: _controller,
            children: [
          Text("hello1"),
          Text("hello2"),
          Text("hello3"),
          Text("hello4")
        ])
    );
  }

  void _onTap(int index){
    switch(index){
      case 0:
        setState(() {
          _primaryColor = Colors.red;
        });
        break;
      case 1:
        setState(() {
          _primaryColor = Colors.amber;
        });
        break;
      case 2:
        setState(() {
          _primaryColor = Colors.deepOrange;
        });
        break;
      case 3:
        setState(() {
          _primaryColor = Colors.pink;
        });
    }
  }
}

