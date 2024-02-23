// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? bio;
  String? image;
  bool? isActive;
  String? token;

  LoginModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.bio,
    this.image,
    this.isActive,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        bio: json["bio"],
        image: json["image"],
        isActive: json["is_active"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "bio": bio,
        "image": image,
        "is_active": isActive,
        "token": token,
      };
}
