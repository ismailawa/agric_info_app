import 'package:agriculture_information/models/product.dart';
import 'package:agriculture_information/models/user.dart';
import 'dart:convert' as json;

import 'package:agriculture_information/models/video.dart';

List<User>parserUser(String jsonString){
  final parseUsers = List<dynamic>.from(json.jsonDecode(jsonString));
  final List<User> users = [];
  parseUsers.forEach( (user){
    users.add(User.fromJson(user));
  });
  return users;
}

List<Video> parseVideo(String jsonString){
  final parseVideo = json.jsonDecode(jsonString) as List;


  final List<Video> videos = [];
  parseVideo.forEach((video){
    videos.add(Video.fromJson(video));
  });

  return videos;
}

List<Product> parseProducts(String jsonString){

  final parseProducts = json.jsonDecode(jsonString) as List;
  final List<Product> products = [];

  parseProducts.forEach((product){
     products.add(Product.fromJson(product));
  });

  return products;
}