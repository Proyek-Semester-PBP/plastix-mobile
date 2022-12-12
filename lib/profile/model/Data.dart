// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory News.fromJson(Map<String, dynamic> json) => News(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.title,
    required this.date,
  });

  String title;
  String date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
      };
}
