import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data.dart';

Future<List<News>> fetchData() async {
  var url = Uri.parse('https://proyek-semester-pbp.up.railway.app/news/json/');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<News> listConsultation = [];
  for (var d in data) {
    if (d != null) {
      listConsultation.add(News.fromJson(d));
    }
  }

  return listConsultation;
}
