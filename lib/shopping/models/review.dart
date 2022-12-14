import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
    Review({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
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
        required this.item,
        required this.user,
        required this.rating,
        required this.comment,
    });

    String item;
    String user;
    int rating;
    String comment;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        item: json["item"],
        user: json["user"],
        rating: json["rating"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "user": user,
        "rating": rating,
        "comment": comment,
    };
}