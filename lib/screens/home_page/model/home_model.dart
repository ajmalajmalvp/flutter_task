// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  int? id;
  User? user;
  String? content;
  String? image;
  DateTime? createdAt;
  bool? isLiked;
  int? likesCount;

  HomeModel({
    this.id,
    this.user,
    this.content,
    this.image,
    this.createdAt,
    this.isLiked,
    this.likesCount,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        content: json["content"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        isLiked: json["is_liked"],
        likesCount: json["likes_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "content": content,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "is_liked": isLiked,
        "likes_count": likesCount,
      };
}

class User {
  int? id;
  String? username;
  String? image;
  String? firstName;
  String? lastName;

  User({
    this.id,
    this.username,
    this.image,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        image: json["image"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image,
        "first_name": firstName,
        "last_name": lastName,
      };
}
