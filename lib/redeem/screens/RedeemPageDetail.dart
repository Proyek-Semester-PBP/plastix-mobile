import 'dart:ui';

import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../model/redeemData.dart';

import'RedeemPage.dart';


class RedeemPageDetail extends StatefulWidget {
  const RedeemPageDetail({Key? key}) : super(key: key);

  @override
  State<RedeemPageDetail> createState() => RedeemPageDetailState();
}

class RedeemPageDetailState extends State<RedeemPageDetail> {
  Fields currentFields = Details.test;




@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/10.png',
                          alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height*0.3,
                          ),
                          Text(
                            currentFields.titleVoucher,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),

                          children: [
                            WidgetSpan(
                              child: Icon(Icons.money, size: 14),
                            ),
                             TextSpan(
                              text: 'Poin  \n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: currentFields.hargaPoin.toString()),
                          ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Deskripsi \n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: currentFields.deskripsi.toString()),
                          ]
                      ),
                    ),
                  ),
                ]
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(30, 40)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () => _dialogBuilder(context),

                  child: const Text('Redeem',
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );

  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Get The Voucher!'),
          content: const Text('Are you sure want to redeem the points?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}


