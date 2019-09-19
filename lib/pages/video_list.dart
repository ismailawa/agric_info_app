import 'package:agriculture_information/models/json_parser.dart';
import 'package:agriculture_information/models/video.dart';
import 'package:agriculture_information/util/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  Future<List<Video>> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://10.0.2.2:3000/api/videos"),
        headers: {'Accept': 'application/json'});
    return parseVideo(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return VideoPlayerM(
                          videoPlayerController: VideoPlayerController.network(
                              'http://10.0.2.2:3000/${snapshot.data[index].videoUrl}'),
                          looping: false,
                        );
                      },
                    ));
              } else {
                return Container(
                  child: Center(
                    child: Text("loading..."),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
