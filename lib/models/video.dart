import 'package:agriculture_information/models/user.dart';

class Video{
  final String id;
  final String title;
  final String videoUrl;
  final String description;
  final User user;

  Video({ this.id, this.title, this.videoUrl, this.description, this.user });


  factory Video.fromJson(Map<String, dynamic> json){
    if(json == null) return null;
    return Video(
      id: json['_id'],
      title: json['title'],
      videoUrl: json['video_url'],
      description: json['description'],
      user: User(
        id: json['_id'],
        name: json['user']['userName'],
        address: json['user']['address'],
        phone: json['user']['phone'],
        imageUrl: json['user']['image_url']

      )
    );
  }
}