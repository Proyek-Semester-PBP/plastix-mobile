import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fryo/shopping/models/recommended_item.dart';
import 'package:fryo/shopping/models/recommended_vendor.dart';

Future<List<RecommendedItem>> fetchRecommendedItem() async {
  Uri url = Uri.parse('https://proyek-semester-pbp.up.railway.app/shopping/json-item/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<RecommendedItem> recommendedItem = [];
  for (var item in data) {
    recommendedItem.add(RecommendedItem.fromJson(item));
  }

  return recommendedItem;
}

Future<List<RecommendedVendor>> fetchRecommendedVendor() async {
  Uri url = Uri.parse('https://proyek-semester-pbp.up.railway.app/shopping/json-vendor/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<RecommendedVendor> recommendedVendor = [];
  for (var vendor in data) {
    recommendedVendor.add(RecommendedVendor.fromJson(vendor));
  }

  return recommendedVendor;
}