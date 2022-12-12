import 'package:flutter/material.dart';
import '../../src/shared/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/redeemData.dart';
import '../screens/RedeemPageDetail.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({Key? key}) : super(key: key);

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class Details {
  static late Fields _test;
  static Fields get test => _test!;
}


class _RedeemPageState extends State<RedeemPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
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
              Text(
                  "Sorry, right now there isn't voucher available"
              ),
              SizedBox(height: 10),
            ],
          );
        } else{
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side:BorderSide(width:2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      dense: true,
                      visualDensity: VisualDensity(vertical: 3),
                    onTap:(){
                      Details._test = snapshot.data![index].fields;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RedeemPageDetail()),
                      );
                    },
                    title: Text(snapshot.data[index].fields.titleVoucher,
                    ),
                    trailing: Text(snapshot.data[index].fields.hargaPoin.toString()),

                  ),


                );

            });
          }
        }
      }

    )
    );
  }

  Future<List<RedeemList>> fetchRedeemList() async {
    var url = Uri.parse(
        'https://proyek-semester-pbp.up.railway.app/redeem/json/');
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
