// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserData> userDataFromJson(String str) =>
    List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  UserData({
    required this.user,
    required this.name,
    required this.email,
    required this.mobile,
    required this.github,
    required this.instagram,
    required this.twitter,
    required this.facebook,
    required this.point,
    required this.userId,
    required this.weight,
    required this.profpic,
  });

  String user;
  String name;
  String email;
  String mobile;
  String github;
  String instagram;
  String twitter;
  String facebook;
  int point;
  int userId;
  int weight;
  String profpic;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: json["user"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        github: json["github"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        facebook: json["facebook"],
        point: json["point"],
        userId: json["user_id"],
        weight: json["weight"],
        profpic: json["profpic"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "email": email,
        "mobile": mobile,
        "github": github,
        "instagram": instagram,
        "twitter": twitter,
        "facebook": facebook,
        "point": point,
        "user_id": userId,
        "weight": weight,
        "profpic": profpic,
      };
}
