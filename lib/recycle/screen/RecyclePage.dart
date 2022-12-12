import 'package:flutter/material.dart';
import 'package:fryo/recycle/screen/FormPickup.dart';
import 'package:fryo/recycle/screen/FormDropoff.dart';
import '../../src/shared/styles.dart';
import '../../src/shared/colors.dart';
import '../../src/shared/fryo_icons.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fryo/src/screens/HomePage.dart';
// import 'dart:js' as js;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:fryo/src/utils/fetchHistory.dart';

class RecyclePage extends StatefulWidget {
  // final String pageTitle;
  // WebViewXController webviewController;

  RecyclePage({Key? key}) : super(key: key);

  @override
  _RecyclePageState createState() => _RecyclePageState();
}

class _RecyclePageState extends State<RecyclePage> {
  List<Location> locations = [
    Location(
      name: "AEON Serpong",
      detail: "Lantai 4 blok AB2",
      image: "images/recycle/aeon-serpong.png",
      link: "https://goo.gl/maps/2VLCQQwM51wxzRVB8",
    ),
    Location(
      name: "Botani Square",
      detail: "Lantai GF blok C3",
      image: "images/recycle/botani.png",
      link: "https://goo.gl/maps/bvR3HRBKL59QVuos8",
    ),
    Location(
      name: "Kota Kasablanka",
      detail: "Lantai 1 blok C1",
      image: "images/recycle/kokas.png",
      link: "https://goo.gl/maps/52vuuK3WJA69kLQj8",
    ),
    Location(
      name: "Margocity Depok",
      detail: "Lantai 3 blok N12",
      image: "images/recycle/margo.png",
      link: "https://goo.gl/maps/yDq5jz5vr6oLhLzP9",
    ),
    Location(
      name: "Paris Van Java",
      detail: "Lantai 6 blok AB3",
      image: "images/recycle/pvj.png",
      link: "https://goo.gl/maps/fdA2tc98oMKMiMjz6",
    ),
    Location(
      name: "Plaza Indonesia",
      detail: "Lantai GF blok C17",
      image: "images/recycle/pi.png",
      link: "https://goo.gl/maps/YFXvtyeMoKMg33PT7",
    ),
    Location(
      name: "Senayan City",
      detail: "Lantai 2 blok AC22",
      image: "images/recycle/senayan-city.png",
      link: "https://goo.gl/maps/muXjRyT1tEfWmh757",
    ),
    Location(
      name: "Summarecon Bekasi",
      detail: "Lantai 1 blok C5",
      image: "images/recycle/smb.png",
      link: "https://goo.gl/maps/oRccP9ZvWKcuWi2o6",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
            Text('Recycle', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            iconSize: 21,
            icon: Icon(Fryo.power_swtich),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage("images/recycle/bg-recycle.png")),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "PlasTIX hadir untuk membantu kalian semua dalam melakukan daur ulang sampah plastik. Kami menyediakan 2 fitur, yaitu drop off dan pick up. Pada fitur drop off, kami menyediakan beberapa vending machine yang tersedia pada 8 lokasi yang ditampilkan di bawah. Sementara itu, untuk fitur drop off, kami menyediakan jasa penjemputan sampah plastik untuk kalian semua yang berada di daerah Jabodetabek.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  )),
              Card(
                margin: EdgeInsets.only(
                    left: 80.0, right: 80.0, bottom: 80.0, top: 50.0),
                elevation: 20,
                shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
                color: Color(0xFFE4DEAE),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[0].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[0].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[0].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[0]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[1].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[1].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[1].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[1]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[2].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[2].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[2].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[2]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[3].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[3].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[3].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[3]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[4].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[4].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[4].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[4]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[5].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[5].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[5].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[5]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[6].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[6].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[6].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[6]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                    ),
                    Text(
                      locations[7].name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                    ),
                    Text(
                      locations[7].detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      splashRadius: 10.0,
                      onPressed: () async {
                        var url = Uri.parse(locations[7].link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Image.asset(
                        locations[7]
                            .image, // On click should redirect to an URL
                        width: 230.0,
                        height: 190.0,
                      ),
                      iconSize: 200.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    Align(
                        child: SizedBox(
                      width: 370,
                      height: 40,
                      child: FloatingActionButton(
                          heroTag: null,
                          shape: (RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: Color(0xFF198754),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormDropoff()),
                            );
                          },
                          child: Text(
                            "Click here when you're at our vending machine",
                          )),
                    )),
                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    // )
                  ],
                ),
              ),
              Image(
                image: AssetImage("images/recycle/motor-recycle.gif"),
                width: 400,
                height: 190,
              ),
              Card(
                margin: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 80.0, right: 80.0),
                elevation: 20,
                shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
                color: Color(0xFFE4DEAE),
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: ListView(shrinkWrap: true, children: [
                    Text(
                      "PlasTIX menyediakan fitur pick up. Kalian dapat mengklik button di bawah untuk memasukkan lokasi penjemputan Anda dan kami akan segera datang untuk menjemput.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                    Align(
                        child: SizedBox(
                      width: 70,
                      height: 40,
                      child: FloatingActionButton(
                          shape: (RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: Color(0xFF198754),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPickup()),
                            );
                          },
                          child: Text(
                            "Pick Up",
                          )),
                    )),
                    Container(
                      margin: EdgeInsets.all(10.0),
                    ),
                  ]),
                ),
              ),
              FutureBuilder(
                  future: fetchHistory(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data.length == 0) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(30.0),
                            ),
                            Text(
                              "No History",
                              style: TextStyle(
                                  color: Color(0xFF198754), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 50.0, left: 20, right: 20, bottom: 50),
                          child: Table(
                            border: TableBorder.all(
                                color: Color.fromARGB(255, 157, 194, 148)),
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 205, 241, 197)),
                                  children: [
                                    Text('Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    Text('Date',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    Text('Location',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    Text('Weight',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                    Text('Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ]),
                              snapshot.data.map((history) {
                                return TableRow(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 205, 241, 197)),
                                    children: [
                                      Text(history.fields.name,
                                          textAlign: TextAlign.center),
                                      Text(history.fields.date,
                                          textAlign: TextAlign.center),
                                      Text(history.fields.location,
                                          textAlign: TextAlign.center),
                                      Text(history.fields.weight.toString(),
                                          textAlign: TextAlign.center),
                                      Text(history.fields.description,
                                          textAlign: TextAlign.center),
                                    ]);
                              }).toList(),
                              // TableRow(
                              //     decoration: BoxDecoration(
                              //         color:
                              //             Color.fromARGB(255, 205, 241, 197)),
                              //     children: [
                              //       Text('Name',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center),
                              //       Text('Date',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center),
                              //       Text('Location',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center),
                              //       Text('Weight',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center),
                              //       Text('Description',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold),
                              //           textAlign: TextAlign.center),
                              //     ]),
                            ],
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Location {
  String name, detail, image, link;

  Location({
    required this.name,
    required this.detail,
    required this.image,
    required this.link,
  });
}
