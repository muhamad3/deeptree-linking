import 'package:cloud_firestore/cloud_firestore.dart';

class user {
  String? name;
  String? uid; // the uid from firebase auth service
  String? email;
  String? github;
  String? stackOverflow;
  String? linkedIn;
  String? title;
  String? bio;
  String? location;
  int? points;
  String? imgUrl; // Firebase Storage
 

user(
      {this.uid,
      this.name,
      this.email,
      this.github,
      this.imgUrl,
      this.points,
      this.linkedIn,
      this.stackOverflow,
      this.bio,
      this.location,
      this.title});

  // from map which reads the data from the database

  factory user.fromMap(Map<String, dynamic> json) => user(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      github: json["github"],
      imgUrl: json["imgUrl"],
      points: json["points"],
      stackOverflow: json["stackOverflow"],
      linkedIn: json["linkedIn"],
      title: json["title"],
      location: json["location"],
      bio: json["bio"],);

  // toMap()
  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "github": github,
        "imgUrl": imgUrl,
        "points": points,
        "stackOverflow": stackOverflow,
        "linkedIn": linkedIn,
        "bio": bio,
        "location": location,
        "title": title,
      };
}
