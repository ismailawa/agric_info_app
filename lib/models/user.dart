class User {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String imageUrl;

  User({this.id,this.name, this.address, this.phone, this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    if(json == null) return null;
    return User(
        id: json['_id'],
        name: json['userName'] ,
        address: json['address'],
        phone: json['phone'],
        imageUrl: json['image_url']
    );
  }
}