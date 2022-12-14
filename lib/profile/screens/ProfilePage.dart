import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fryo/src/screens/HomePage.dart';

import '../../src/shared/styles.dart';
import '../../src/shared/colors.dart';
import '../../src/shared/fryo_icons.dart';

import './EditProfilePage.dart';
import 'package:page_transition/page_transition.dart';


import '../utils/user_prefrences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/number_widget.dart';
import '../model/user.dart';
import '../model/UserData.dart';

class ProfilePage extends StatefulWidget {
  final String pageTitle;

  ProfilePage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<UserData>> dataFuture;

  @override
  void initState() {
    super.initState();

    dataFuture = fetchUser();
  }

  Future<List<UserData>> fetchUser() async {
    var url = Uri.parse(
        'postgres://udluzxbfbzeywk:83bde16c0226a885e02102aee8d5dc33b859ec133b96d0308ec29310d9fbbcc8@ec2-54-163-34-107.compute-1.amazonaws.com:5432/d16aenjlnqbh7t');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object UserData
    List<UserData> listUserData = [];
    for (var d in data) {
      if (d != null) {
        listUserData.add(UserData.fromJson(d));
      }
    }

    return listUserData;
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('PlastiX',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HomePage(
                          pageTitle: "Plastix",
                        )));
              },
              iconSize: 21,
              icon: Icon(Fryo.power_swtich),
            ),
          ],
        ),
        body: FutureBuilder(
            future: dataFuture,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          ProfileWidget(
                            imagePath: user.imagePath,
                            onClicked: () async {},
                          ),
                          const SizedBox(height: 24),
                          buildName(user),
                          const SizedBox(height: 24),
                          Center(child: buildButton()),
                          const SizedBox(height: 24),
                          NumbersWidget(),
                          const SizedBox(height: 24),
                          buildAbout(user),
                        ],
                      ),
                    );
                  } else {
                    return const Text('No data');
                  }
              }
            }));
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
      );

  Widget buildAbout(User user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.github),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.instagram),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.twitter),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.facebook),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      );

  Widget buildIcon(IconData icon) => Row(
        children: [
          SizedBox(
            width: 60,
          ),
          CircleAvatar(
            radius: 25,
            child: Center(
                child: Icon(
              icon,
              size: 32,
            )),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'AlvaroLuqmanW',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
          ),
        ],
      );
}
