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
        actions: <Widget>[
          // IconButton(
          //   padding: EdgeInsets.all(0),
          //   onPressed: () {},
          //   iconSize: 25,
          //   icon: Icon(Fryo.arrow_left),
          // )
        ],
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
                          Text(
                            currentFields.titleVoucher,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
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
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Poin:  ',
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
                              text: 'Rating: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: currentFields.deskripsi.toString()),
                          ]
                      ),
                    ),
                  ),
                  // if(Watched.DONE == true)...[
                  //   Padding(
                  //     padding: const EdgeInsets.all(5.0),
                  //     child: RichText(
                  //       textAlign: TextAlign.start,
                  //       text: const TextSpan(
                  //           style: TextStyle(
                  //             fontSize: 14.0,
                  //             color: Colors.black,
                  //           ),
                  //           children: <TextSpan>[
                  //             TextSpan(
                  //               text: 'Status: ',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //             TextSpan(text:'watched'),
                  //           ]
                  //       ),
                  //     ),
                  //   ),
                  // ]
                  // else ...[
                  //   Padding(
                  //     padding: const EdgeInsets.all(5.0),
                  //     child: RichText(
                  //       textAlign: TextAlign.start,
                  //       text: const TextSpan(
                  //           style: TextStyle(
                  //             fontSize: 14.0,
                  //             color: Colors.black,
                  //           ),
                  //           children: <TextSpan>[
                  //             TextSpan(
                  //               text: 'Status: ',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //             TextSpan(text: 'not watched'),
                  //           ]
                  //       ),
                  //     ),
                  //   ),
                  // ],
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Review: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      currentFields.hargaPoin.toString(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ]
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

