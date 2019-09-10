import 'package:flutter/material.dart';
import 'package:custom_chewie/custom_chewie.dart';
import 'package:video_player/video_player.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              controller: _controller, tabs: [
            Tab(
              child: Text("Home"),
            ),
            Tab(
              child: Text("Favourite"),
            ),
            Tab(
              child: Text("Popular"),
            ),
            Tab(
              child: Text("Recommended"),
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
}
