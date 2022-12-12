import 'dart:convert';

List<RecommendedVendor> recommendedVendorFromJson(String str) => List<RecommendedVendor>.from(json.decode(str).map((x) => RecommendedVendor.fromJson(x)));

String recommendedVendorToJson(List<RecommendedVendor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendedVendor {
    RecommendedVendor({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory RecommendedVendor.fromJson(Map<String, dynamic> json) => RecommendedVendor(
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
        required this.description,
        required this.link,
    });

    String name;
    String image;
    String description;
    String link;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "link": link,
    };
}