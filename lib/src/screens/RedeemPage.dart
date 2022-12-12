import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import '../shared/fryo_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/redeemData.dart';

class RedeemPage extends StatefulWidget {
  final String pageTitle;
  final Product productData;

  RedeemPage({Key? key, required this.pageTitle, required this.productData})
      : super(key: key);

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          actions: <Widget>[
            // IconButton(
            //   padding: EdgeInsets.all(0),
            //   onPressed: () {},
            //   iconSize: 25,
            //   icon: Icon(Fryo.arrow_left),
            // )
          ],
        ),
        body: FutureBuilder(
            future: fetchRedeemList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text("Sorry, right now there isn't voucher available"),
                      SizedBox(height: 10),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "${snapshot.data[index].fields.titleVoucher}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }

  Future<List<RedeemList>> fetchRedeemList() async {
    var url =
        Uri.parse('https://proyek-semester-pbp.herokuapp.com/redeem/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<RedeemList> listRedeemList = [];
    for (var d in data) {
      if (d != null) {
        listRedeemList.add(RedeemList.fromJson(d));
      }
    }

    return listRedeemList;
  }
}
