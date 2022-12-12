import 'package:fryo/src/model/recycleHistory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<RecycleHistory>> fetchHistory(CookieRequest request) async {
  List<RecycleHistory> recycleHistories = [];
  try {
    String url = 'https://proyek-semester-pbp.up.railway.app/recycle/json/';
    final response = await request.get(url);

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(response);
    print(data);

    // melakukan konversi data json menjadi object ToDo

    for (var d in data) {
      if (d != null) {
        recycleHistories.add(RecycleHistory.fromJson(d));
      }
    }
  } catch (error) {
    print('ERRRRRRORRRRRR');
  }

  // melakukan decode response menjadi bentuk json

  return recycleHistories;
}
