import 'package:agriculture_information/models/video.dart';

class Product {
  final String id;
  final String name;
  final String type;
  final String description;
  final String imageUrl;
  final bool available;
  final dynamic prize;
  final String pClass;
  final String user;
  final Video video;

  Product( { this.id, this.name, this.type, this.description, this.imageUrl, this.available, this.prize, this.pClass, this.user, this.video });

  factory Product.fromJson(Map<String, dynamic> json){
    if(json == null) return null;

    return Product(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      imageUrl: json['image_url'],
      available: json['available'],
      prize: json['prize'],
      pClass: json['class'],
      user: json['user'],
      video: Video(
        id: json['video']['_id'],
        title: json['video']['title'],
        description: json['video']['description'],
        videoUrl: json['video']['video_url']
      )
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "_id": id,
      "name": name,
      "type": type,
    };
  }
}