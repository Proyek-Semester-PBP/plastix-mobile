import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fryo/shopping/models/recommended_item.dart';
import 'package:fryo/shopping/models/recommended_vendor.dart';
import 'package:fryo/shopping/models/review.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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

Future<List<RecommendedItem>> fetchBookmarks(CookieRequest request) async {
  var response = await request.get(
    "https://proyek-semester-pbp.up.railway.app/auth/show_bookmarks/"
  );

  List<RecommendedItem> bookmarks = [];
  for (var bookmark in response) {
    bookmarks.add(RecommendedItem.fromJson(bookmark));
  }

  return bookmarks;
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

Future<List<Review>> fetchReview() async {
  Uri url = Uri.parse('https://proyek-semester-pbp.up.railway.app/shopping/json-review/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Review> highlightedReview = [];
  for (var review in data) {
    highlightedReview.add(Review.fromJson(review));
  }

  return highlightedReview;
}