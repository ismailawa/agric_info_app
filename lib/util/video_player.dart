import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerM extends StatefulWidget {

  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoPlayerM({Key key, this.videoPlayerController, this.looping}) : super(key: key);

  _VideoPlayerMState createState() => _VideoPlayerMState();
}

class _VideoPlayerMState extends State<VideoPlayerM> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage){
        return Center(
          child: Text(errorMessage),
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          color: Colors.green.shade800,
          height: 200,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
