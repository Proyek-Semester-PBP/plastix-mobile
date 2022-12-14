import 'dart:convert';
import 'package:fryo/src/model/user.dart';

List<RecycleHistory> historyFromJson(String str) => List<RecycleHistory>.from(
    json.decode(str).map((x) => RecycleHistory.fromJson(x)));

String historyToJson(List<RecycleHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecycleHistory {
  RecycleHistory({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory RecycleHistory.fromJson(Map<String, dynamic> json) => RecycleHistory(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.name,
    required this.date,
    required this.weight,
    required this.point,
    required this.location,
    required this.is_pickup,
    required this.description,
  });

  User user;
  String name;
  String date;
  int weight;
  int point;
  String location;
  bool is_pickup;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        date: json["date"],
        weight: json["weight"],
        point: json["point"],
        location: json["location"],
        is_pickup: json["is_pickup"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date": date,
        "weight": weight,
        "point": point,
        "location": location,
        "is_pickup": is_pickup,
        "description": description,
      };
}
