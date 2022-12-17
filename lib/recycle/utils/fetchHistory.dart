import 'package:fryo/recycle/model/recycleHistory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<RecycleHistory>> fetchHistory(CookieRequest request) async {
  List<RecycleHistory> recycleHistories = [];
  // try {
  //   String url = 'https://proyek-semester-pbp.up.railway.app/recycle/json/';
  //   final response = await request.get(url);

  //   // ignore: avoid_print
  //   // print(response['model']);

  //   // melakukan konversi data json menjadi object ToDo
  //   var data = jsonDecode(utf8.decode(response.bodyBytes));
  //   for (var d in data) {
  //     if (d != null) {
  //       recycleHistories.add(RecycleHistory.fromJson(d));
  //       print('masuk');
  //     }
  //   }
  // } catch (error) {
  //   print('ERRRRRRORRRRRR');
  // }

  String url = 'https://proyek-semester-pbp.up.railway.app/recycle/json/';
    final response = await request.get(url);

    // ignore: avoid_print
    // print(response['model']);

    // melakukan konversi data json menjadi object ToDo
    // var data = jsonDecode(utf8.decode(response.bodyBytes));
    for (var d in response) {
      if (d != null) {
        recycleHistories.add(RecycleHistory.fromJson(d));
        print('masuk');
      }
    }
  // melakukan decode response menjadi bentuk json

  return recycleHistories;
}
