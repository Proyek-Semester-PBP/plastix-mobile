import 'package:flutter/material.dart';
import '../shared/colors.dart';
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
  static Fields get test => _test;
}


class _RedeemPageState extends State<RedeemPage>{
  late String _image;
  String _setImage(){
    Fields currentFields = Details.test;
    String? _jenis = currentFields.jenisVoucher as String;

    if (_jenis == ""){
      _image = 'images/belanja.png';

    } else if(_jenis == ""){
      _image = 'images/pulsa.png';

    } else if (_jenis == ""){
      _image = 'images/shop.png';

    }

    return _image;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                      Text(
                          "Sorry, right now there isn't voucher available"
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Details._test = snapshot.data![index].fields;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RedeemPageDetail()),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children:[
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage(_setImage());

                                  )
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
                      )
                  );
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
