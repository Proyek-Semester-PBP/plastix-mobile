import 'dart:convert';

List<RecommendedItem> recommendedItemFromJson(String str) => List<RecommendedItem>.from(json.decode(str).map((x) => RecommendedItem.fromJson(x)));

String recommendedItemToJson(List<RecommendedItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendedItem {
    RecommendedItem({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory RecommendedItem.fromJson(Map<String, dynamic> json) => RecommendedItem(
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
        required this.name,
        required this.image,
        required this.price,
        required this.description,
        required this.link,
        required this.bookmarks,
    });

    String name;
    String image;
    int price;
    String description;
    String link;
    List<dynamic> bookmarks;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        link: json["link"],
        bookmarks: List<dynamic>.from(json["bookmarks"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "link": link,
        "bookmarks": List<dynamic>.from(bookmarks.map((x) => x)),
    };
}